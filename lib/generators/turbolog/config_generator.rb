module Turbolog
  module Generators
    class ConfigGenerator < Rails::Generators::Base
      def self.source_root
        File.dirname(__FILE__) + "/templates"
      end

      desc "Config mongoid"
      def config_mongoid
        run "rails g mongoid:config"
      end

      def create_welcome
        run "rails g scaffold welcome greeting:text"
      end

      desc "Configure Devise"
      def config_devise
        puts "rails g devise:install...............\n"
        run "rails generate devise:install"
        puts "rails g devise User..................\n"
        run "rails generate devise User"
        #remove another devise from rails g devise User
        gsub_file 'config/routes.rb',/devise_for :users\n/,''
        gsub_file 'config/routes.rb',/root.*/,'root to: \'welcomes#index\''
      end
      def get_welcome
        inject_into_file 'config/routes.rb', :after => 'Rails.application.routes.draw do' do
            "\n  get 'welcomes/index'\n"
        end
      end

      desc "Backup Files if previous installed"
      # def backup_files
      #   inside("app/controllers") {(File.file? "Users/omniauth_callbacks_controller.rb") ? (mv omniauth_callbacks_controller.rb omniauth_callbacks_controller.rb.bak) : (puts "Backup omniauth_callbacks_controller.rb")}
      # end

      def authenticate_user
        puts "authenticate_user...................\n"
        inject_into_file 'app/controllers/application_controller.rb', :after => 'class ApplicationController < ActionController::Base' do
          "\n  before_action :authenticate_user!\n"
        end
      end
      
      def setup_routes
        puts "setup_routes........................\n"
        route "devise_for :users, :controllers => { :omniauth_callbacks => \"users/omniauth_callbacks\" }"
      end


      desc "Set up omniauth config"
      def setup_omniauth
        puts "config devise for facebook...........\n"
        inject_into_file 'config/initializers/devise.rb', :after => 'Devise.setup do |config|' do
          "\n  config.omniauth :facebook, ENV['FACEBOOK_API'], ENV['FACEBOOK_SECRET']\n"
        end
        puts "config user for facebook.............\n"
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

        puts "Add field provider to User...........\n"
        inject_into_file 'app/models/user.rb', :after => '  field :encrypted_password, type: String, default: ""' do
          "\n  field :provider,           type: String, default: \"\"\n"
        end

      end

      desc "Add Log In/Log Out to application.html.erb"
        puts "Add Log In/Log Out to application.html.\n"

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
        puts "      Finished Configured devise omniauth for Facebook.\n"
        puts "\n"
      
      end
    end
  end
end

