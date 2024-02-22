class ProductPolicy < ApplicationPolicy
  def new?
    user.is_admin?
  end

  def create?
    user.is_admin?
  end
  
  def edit?
    user.is_admin?
  end
  def update?
    user.is_admin?
  end
  def destroy?
    user.is_admin?
  end
  def add_item?
    !user.is_admin?
  end
end
