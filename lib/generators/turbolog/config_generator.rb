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
        puts Color.blue(" ..............Remove devise from routes.............\n")
        gsub_file 'config/routes.rb',/devise_for.*\n/,''
        puts Color.blue("....................rails g devise User.................\n")
        run "rails generate devise User"
        gsub_file 'config/initializers/devise.rb',/# config.secret_key/,'config.secret_key'
      end

      desc "Create Initial Sample Controller"
        puts Color.blue(".............Create Welcome Initial Controller..........\n")
      def create_welcome
        run "rails g scaffold welcome greeting:text"
        #copy_file "welcomes_controller_spec.rb","spec/controllers"
        #copy_file "welcomes_spec.rb","spec/models"
      end

      def config_root
        # set root to Welcome
        puts Color.blue(".................config routes for user ................\n")
        copy_file "routes.rb","config/routes.rb"
      end

      def dot_option
        # set root to Welcome
        puts Color.blue("......................config .rspec ....................\n")
        copy_file ".rspec",".rspec"
        copy_file ".env",".env"
        copy_file ".gitignore",".gitignore" #protect .env
      end

      desc "authenticate_user"
      def authenticate_user
        puts Color.blue("..............Authenticate user in application..........\n")
        inject_into_file 'app/controllers/application_controller.rb', :after => 'class ApplicationController < ActionController::Base' do
          "\n  before_action :authenticate_user!\n"
        end
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

      desc "Config default mail server in development and test"
        puts Color.blue("......Add Log In/Log Out View in application.html.......\n")
      def set_default_mailer
        inject_into_file 'config/environments/development.rb', :after => 'ails.application.configure do' do
         "\n  ## config default mail server \n" +
         "  config.action_mailer.default_url_options = { host\: \"localhost\:3000\" }\n"
         end
         inject_into_file 'config/environments/test.rb', :after => 'ails.application.configure do' do
         "\n  ## config default mail server \n" +
         "  config.action_mailer.default_url_options = { host\: \"localhost\:3000\" }\n"
         end 
       end

      desc "Add user spec"
        puts Color.blue("......................Add Spec Data.....................\n")
      def add_spec
        directory "spec"
        directory "lib"
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

