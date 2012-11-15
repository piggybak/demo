class Ability
  include CanCan::Ability
  def initialize(user)
    if user && user.roles.include?(Role.find_by_name("admin"))
      can :dashboard
      can :access, :rails_admin
      can [:read, :edit], Frame
      can :manage, [
                    Image,
                    Page,
                    Role,
                    User]
      can :manage, Piggybak.config.manage_classes.map(&:constantize)
      Piggybak.config.extra_abilities.each do |extra_ability|
        can extra_ability[:abilities], extra_ability[:class_name].constantize
      end
    end
  end
end
