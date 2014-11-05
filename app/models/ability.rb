class Ability

  include CanCan::Ability

  def initialize( user )
    user ||= User.new(role: nil)

    # can :manage, Order, Order.managed_by_user(user.id) do |order|
    #    order.user.vendor_id == user.id
    #  end
    # can :manage, Item if user.admin?
    # can :manage, Category if user.admin?
    if user.is? :admin
      can :manage, :all
    elsif user.is? :store_admin
      can :manage, Item, vendor_id: user.vendor.id
      can :manage, Category
      can :manage, User, vendor_id: user.id
      cannot :manage, User, self_managed: true
      can :manage, User, id: user.id
    elsif user.is? :user
      can :create, Order
      can :read, Order
      can :manage, User, id: user.id
      can :manage, Review
    end
    can :read, Item
    can :read, Category
    can :read, Review
    can :create, User
  end

end
