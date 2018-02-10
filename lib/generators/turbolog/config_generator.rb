require 'turbolog/helpers'
module Turbolog
  module Generators
    class ConfigGenerator < Rails::Generators::Base
      def self.source_root
        File.dirname(__FILE__) + "/templates"
      end

      def self.blue(mytext) 
         "\e[34m#{mytext}\e[0m".center(40)
      end

      desc "Config mongoid"
        puts Color.blue(" .................run mongoid:config....................\n")

      def config_mongoid
        run "rails g mongoid:config"
      end

      def sethost_mongoid
        puts Color.blue("..............change localhost to 127.0.0.1.............\n")
        gsub_file 'config/mongoid.yml','localhost:27017','127.0.0.1:27017'
      end

      desc "Configure Devise"
      def config_devise
        puts Color.blue("..................rails g devise:install................\n")
        run "rails generate devise:install"
        puts Color.blue("....................rails g devise User.................\n")
        run "rails generate devise User"
        # remove another devise from rails g devise User
        gsub_file 'config/routes.rb',/devise_for :users\n/,''

      end

      desc "Create Initial Controller"
        puts Color.blue(".............Create Welcome Initial Controller..........\n")
      def create_welcome
        run "rails g scaffold welcome greeting:text"
      end

      def config_welcome
        # set root to Welcome
        puts Color.blue("................Set root to:  welcomes#index ...........\n")
        gsub_file 'config/routes.rb',/root.*/,'root to: \'welcomes#index\''
        inject_into_file 'config/routes.rb', :after => 'Rails.application.routes.draw do' do
            "\n  get 'welcomes/index'\n"
        end
      end

      desc "authenticate_user"
      def authenticate_user
        puts Color.blue("..............Authenticate user in application..........\n")
        inject_into_file 'app/controllers/application_controller.rb', :after => 'class ApplicationController < ActionController::Base' do
          "\n  before_action :authenticate_user!\n"
        end
      end
      
      def setup_routes_users
        puts Color.blue(".................Setup routes for Users.................\n")
        route "devise_for :users, :controllers => { :omniauth_callbacks => \"users/omniauth_callbacks\" }"
      end


      desc "Set up omniauth config"
      def setup_omniauth
        puts Color.blue("...............config devise for facebook...............\n")
        inject_into_file 'config/initializers/devise.rb', :after => 'Devise.setup do |config|' do
          "\n  config.omniauth :facebook, ENV['FACEBOOK_API'], ENV['FACEBOOK_SECRET']\n"
        end
        puts Color.blue("..............config user model for facebook............\n")
        inject_into_file 'app/models/user.rb', :after => 'include Mongoid::Document' do
        "\n\n  include Mongoid::Attributes::Dynamic" +
          "\n  devise :omniauthable, :omniauth_providers => [:facebook]" +
          "\n  def self.from_omniauth(auth)" +
          "\n     where(provider: auth.provider, uid: auth.uid).first_or_create do |user|" +
          "\n     user.email = auth.info.email" +
          "\n     user.password = Devise.friendly_token[0,20]" +
          "\n    end" + 
          "\n  end\n" 
        end

        puts Color.blue("...........Add field [provider] to user model...........\n")
        inject_into_file 'app/models/user.rb', :after => '  field :encrypted_password, type: String, default: ""' do
          "\n  field :provider,           type: String, default: \"\"\n"
        end

      end

      desc "Add Log In/Log Out View in application.html.erb"
        puts Color.blue("......Add Log In/Log Out View in application.html.......\n")

      def log_in_out
        inject_into_file 'app/views/layouts/application.html.erb', :after => '<body>' do
         "\n                                           "+
         "\n    <p class=\"notice\"><%= notice %></p>" +
         "\n    <p class=\"alert\"><%= alert %></p>" +
         "\n    <% if user_signed_in? %>" +
         "\n      <%= link_to \"Log Out\", destroy_user_session_path, method: :delete %>" +
         "\n    <% else %>" +
         "\n      <%= link_to(\"Log In\", new_user_session_path) %>" +
         "\n    <% end %>\n" 
         end
       end
        
      def finish
        puts "\n"
        puts Color.blue("________________________________________________________\n")
        puts Color.blue("                 Finished Step 3/3\n")
        puts Color.blue("________________________________________________________\n")
      end
    end
  end
end

