class Ability

  include CanCan::Ability

  def initialize( user )
    user ||= User.new(role: nil)

    if user.is? :admin
      can :manage, :all
    elsif user.is? :store_admin
      can :manage, Item, organization_id: user.organization.id
      can :maange, Category
      can :create, User
      can :manage, User, manager_id: user.id
      cannot :manage, User, self_managed: true
      can :manage, User, id: user.id
    elsif user.is? :user
      can :read, Item
      can :read, Category
      can :create, Order
      can :read, Order
      can :manage, User, id: user.id
      can :manage, Review
    else
      can :read, Item
      can :read, Category
      can :read, Review
      can :create, User
    end
  end

end
