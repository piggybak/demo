class Ability
  include CanCan::Ability
  def initialize(user)
    if user && user.roles.include?(Role.find_by_name("admin"))
      can :dashboard
      can :access, :rails_admin
      can [:read, :destroy, :edit, :new, :export, :history, :download, :cancel], [
                    Image,
                    ::PiggybakVariants::Option,
                    ::PiggybakVariants::OptionConfiguration,
                    ::PiggybakVariants::OptionValue,
                    ::PiggybakTaxonomy::NavigationNode,
                    Page,
                    Role,
                    User,
                    ::Piggybak::Sellable,
                    ::Piggybak::ShippingMethod,
                    ::Piggybak::PaymentMethod,
                    ::PiggybakCoupons::Coupon,
                    ::PiggybakGiftcerts::Giftcert,
                    ::Piggybak::TaxMethod,
                    ::Piggybak::State,
                    ::Piggybak::Country,
                    ::Piggybak::Order]
      can [:read, :edit], ::PiggybakGiftcerts::BuyableGiftcert
      can [:read, :edit], ::Frame
      can [:nestable], ::PiggybakTaxonomy::NavigationNode
    end
  end
end
