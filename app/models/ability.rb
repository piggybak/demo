class Ability
  include CanCan::Ability
  def initialize(user)
    if user && user.roles.include?(Role.find_by_name("admin"))
      can :dashboard
      can :access, :rails_admin
      can [:read, :destroy, :edit, :new, :export, :history, :download, :cancel], [Category,
                    Image,
                    Page,
                    Role,
                    User,
                    ::Piggybak::Sellable,
                    ::Piggybak::ShippingMethod,
                    ::Piggybak::PaymentMethod,
                    ::PiggybakCoupons::Coupon,
                    ::Piggybak::TaxMethod,
                    ::Piggybak::State,
                    ::Piggybak::Country,
                    ::Piggybak::Order]

      # TODO: Figure out why this is throwing a RailsAdmin exception
      cannot [:edit, :destroy, :new], Image
    end
  end
end
