# realtie.rb require to run *.rake
require 'turbolog'

module Turbolog
  require 'rails'
  class Railtie < Rails::Railtie
    # initializer "testing" do |app|
    #   ActionController::Base.send :include, Jinda::Helpers
    # end
    rake_tasks do
      load "tasks/turbolog.rake"
    end
  end
end

# module ApplicationHelper
#   include Jinda::Helpers
# end
