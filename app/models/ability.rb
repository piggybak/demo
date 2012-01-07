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
                    ::Piggybak::Variant,
                    ::Piggybak::ShippingMethod,
                    ::Piggybak::PaymentMethod,
                    ::Piggybak::TaxMethod,
                    ::Piggybak::State,
                    ::Piggybak::Country]

      # can't delete orders
      can [:email, :download, :read, :create, :update, :history, :export], ::Piggybak::Order
    end
  end
end
