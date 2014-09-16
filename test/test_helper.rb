ENV['RAILS_ENV'] = 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'active_merchant/billing/rails'

class ActiveSupport::TestCase
  # Instead use sample.psql loaded into piggybak_test database
  fixtures :all

  def setup
    ActionController::Base.allow_forgery_protection = false
  end

  def teardown
    ActionController::Base.allow_forgery_protection = true
  end

end
