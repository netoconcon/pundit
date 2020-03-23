class RestaurantPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      #anyone can view the restaurant
      # scope.all

      # display only owner restaurants
      scope.where(user: user)
    end
  end


  def show?
    true
  end

  # def new? we do not need new because it look on create?
  #   true
  # end

  def create?
    true # anyone can create a new restaurant
  end

  # def edit? we do not need new because it look on update?
  #   # user -> current_user
  #   # record -> @restaurant
  #   record.user == user
  # end

  def update?
    record.user == user || user.admin
  end

  def destroy?

    # only admin can destroy
    #only user can destroy
     is_user_owner? || user.admin
  end

  private

  def is_user_owner?
    record.user == user
  end
end
