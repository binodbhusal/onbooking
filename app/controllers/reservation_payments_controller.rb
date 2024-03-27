class ReservationPaymentsController < ApplicationController
  before_action :authenticate_user!
  def create
    stripe_card = Stripe::Customer.create_source(
      stripe_customer.id,
      { source: payment_params[:stripeToken] }
    )

    charge = Stripe::Charge.create(
      amount: Money.from_amount(BigDecimal(payment_params[:total])).cents,
      currency: 'eur',
      source: stripe_card.id,
      customer: stripe_customer.id
    )

    reservation = Reservation.create(
      property:,
      user:,
      checkin_date: Date.strptime(payment_params[:checkin_date], '%m/%d/%Y'),
      checkout_date: Date.strptime(payment_params[:checkout_date], '%m/%d/%Y')
    )

    Payment.create(
      reservation:,
      sub_total: Money.from_amount(BigDecimal(payment_params[:sub_total])),
      weekly_discount: Money.from_amount(BigDecimal(payment_params[:weekly_discount])),
      service_fee: Money.from_amount(BigDecimal(payment_params[:service_fee])),
      cleaning_fee: Money.from_amount(BigDecimal(payment_params[:cleaning_fee])),
      total: Money.from_amount(BigDecimal(payment_params[:total])),
      stripe_id: charge.id
    )
    redirect_to payment_success_path
  end

  private

  def payment_params
    params.permit(
      :stripeToken,
      :property_id,
      :user_id,
      :checkin_date,
      :checkout_date,
      :email,
      :weekly_discount,
      :service_fee,
      :cleaning_fee,
      :total
    ).tap do |whitelisted|
      whitelisted[:sub_total] = BigDecimal(params[:sub_total] || '0')
      whitelisted[:weekly_discount] = BigDecimal(params[:weekly_discount] || '0')
      whitelisted[:service_fee] = BigDecimal(params[:service_fee] || '0')
      whitelisted[:cleaning_fee] = BigDecimal(params[:cleaning_fee] || '0')
      whitelisted[:total] = BigDecimal(params[:total] || '0')
    end
  end

  def user
    @user ||= User.find(payment_params[:user_id])
  end

  def property
    @property ||= Property.find(payment_params[:property_id])
  end

  def stripe_customer
    @stripe_customer ||= if user.stripe_id.blank?
                           customer = Stripe::Customer.create(email: user.email)
                           user.update(stripe_id: customer.id)
                           customer
                         else
                           Stripe::Customer.retrieve(user.stripe_id)
                         end
  end
end
