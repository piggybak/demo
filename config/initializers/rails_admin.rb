# RailsAdmin config file. Generated on December 30, 2011 23:03
# See github.com/sferik/rails_admin for more informations

RailsAdmin.config do |config|
  config.authorize_with :cancan

  # If your default_local is different from :en, uncomment the following 2 lines and set your default locale here:
  # require 'i18n'
  # I18n.default_locale = :de

  config.actions do
    # root actions
    dashboard                     # mandatory
    # collection actions
    index                         # mandatory
    new
    export
    history_index
    bulk_delete
    # member actions
    show
    edit
    delete
    history_show
    show_in_app

    # Add the nestable action for each model
    nestable do
      visible do
        [::PiggybakTaxonomy::NavigationNode].include? bindings[:abstract_model].model
      end
    end
  end

  config.current_user_method { current_user } # auto-generated

  # Set the admin name here (optional second array element will appear in a beautiful RailsAdmin red ©)
  config.main_app_name = ['Piggybak Demo', 'Admin']
  # or for a dynamic name:
  # config.main_app_name = Proc.new { |controller| [Rails.application.engine_name.titleize, controller.params['action'].titleize] }

  config.model Page do
    navigation_label "Demo Application"
    list do
      field :title
      field :slug
      field :updated_at
    end
    edit do
      field :title
      field :slug
      field :content, :text do
        ckeditor true
      end
    end
  end
  config.model Image do
    navigation_label "Demo Application"
    list do
      field :title
      field :slug
      field :gallery do
        thumb_method :cart
      end
      field :user
    end
    edit do
      field :title
      field :slug
      field :description
      field :main
      field :categories
      field :user
      include_all_fields 
    end
  end
  config.model Frame do
    navigation_label "Demo Application"
    list do
      field :title
      field :slug
    end
    edit do
      field :title
      field :slug
      field :description
      field :main
      include_all_fields
    end
  end
  config.model User do
    object_label_method :display_name
    navigation_label "Demo Application"
    list do
      field :email
      field :display_name
    end
  end
  config.model Role do
    navigation_label "Demo Application"
  end
end
