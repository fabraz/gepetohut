class Ability
  include CanCan::Ability

  def initialize( user )
    user ||= User.new

    if user.has_role? :admin
        can :manage, :all
    elsif user.has_role? :manager
        can :manage, Employee
        can :manage, Pizza
        can :manage, Ingredient
        can :update, Restaurant
        can :read, :all
    elsif user.has_role? :customer
        can [:show, :update], User, id: user.id
        can [:create, :show], Order
    end
  end
end