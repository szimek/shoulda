require 'rubygems'
require 'active_support'
require 'shoulda'

require 'shoulda/active_record'     if defined? ActiveRecord::Base
require 'shoulda/action_controller' if defined? ActionController::Base
require 'shoulda/action_view'       if defined? ActionView::Base
require 'shoulda/action_mailer'     if defined? ActionMailer::Base

# Load in the 3rd party macros from vendorized plugins and gems
if Rails::VERSION::MAJOR == 2
  Shoulda.autoload_macros RAILS_ROOT, File.join("vendor", "{plugins,gems}", "*")
else
  module Shoulda
    class Railtie < Rails::Railtie
      railtie_name :shoulda

      initializer "shoulda.autoload_macros" do |app|
        Shoulda.autoload_macros Rails.root, File.join("vendor", "{plugins,gems}", "*")
      end
    end
  end
end
