class HostPolicy < ApplicationPolicy
  def new?
    user.host?
  end

  def show?
    user.host?
  end

  def index?
    user.host?
  end

  def update?
    user.host?
  end

  def create?
    user.host?
  end

  def destroy?
    user.host?
  end
end
