class Ability
  include CanCan::Ability
  def initialize(user)
    if user && user.roles.include?(Role.find_by_name("admin"))
      can :access, :rails_admin
      can :manage, [Category,
                    Image,
                    Page,
                    Role,
                    User,
                    ::Piggybak::Product,
                    ::Piggybak::ShippingMethod,
                    ::Piggybak::PaymentMethod,
                    ::Piggybak::ShippingMethodValue,
                    ::Piggybak::PaymentMethodValue]

      # can't delete orders
      can [:read, :create, :update, :history, :export], ::Piggybak::Order
    end
  end
end
