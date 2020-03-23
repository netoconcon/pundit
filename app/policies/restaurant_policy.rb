class RestaurantPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  # def new? we do not need new because it look on create?
  #   true
  # end


  def create?
    true # anyone can create a new restaurant
  end
end
