module Host
  class PaymentsController < ApplicationController
    before_action :authenticate_user!
    def index
      @payments = current_user.receiving_payments
    end
  end
end
