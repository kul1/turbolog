module Turbolog
  module Generators
    class InstallGenerator < Rails::Generators::Base
      desc "Install Turbolog component to existing Rails app "
      def self.source_root
        File.dirname(__FILE__) + "/templates"
      end

      def setup_gems
          gem 'devise'
          gem 'mongo', '~> 2.2'
          gem 'bson', '~> 4.0'
          gem 'mongoid', github: 'mongodb/mongoid'
          gem 'nokogiri' # use for jinda/doc
          gem 'haml', git: 'https://github.com/haml/haml'
          gem 'haml-rails'
          gem 'bcrypt'
          gem 'omniauth-identity'
          gem 'omniauth-facebook'
          gem 'dotenv-rails'
        gem_group :development, :test do
          gem 'rspec'
          gem 'rspec-rails'
          gem 'better_errors'
          gem 'binding_of_caller'
          gem 'pry-byebug'
          gem 'factory_bot_rails'
          gem 'guard'
          gem 'guard-rspec'
          gem 'guard-minitest'
          gem 'capybara'
          gem 'rb-fsevent'
        end
      end

      def backup_files
        inside("app/controllers") {(File.file? "Users/omniauth_callbacks_controller.rb") ? (run "mv omniauth_callbacks_controller.rb omniauth_callbacks_controller.rb.bak") : (puts "No omniauth_callbacks_controller.rb")}
        inside("config/initializers") {(File.file? "devise.rb") ? (run "mv devise.rb devise.rb.bak") : (puts "No devise.rb")}
        inside("app/models") {(File.file? "user.rb") ? (run "mv user.rb user.rb.bak") : (puts "No user.rb")}
        inside("app/views/layouts") {(File.file? "application.html.erb") ? (run "cp application.html.erb application.html.erb.bak") : (puts "No application.html.erb")}
        inside("config") {(File.file? "routes.rb") ? (run "cp routes.rb routes.rb.bak") : (puts "No routes.rb")}
        directory "app"
      end
      def remove_devise
        gsub_file 'config/routes.rb',/devise_for.*\n/,''
      end
      def create_welcome
        run "rails g scaffold welcome greeting:text"
      end


      def finish
        puts "\n"
        puts "Backup existing configuration files.\n"
        puts "Modify Gemfile with devise omniauth gems.\n"
        puts "Please run the following command:\n"
        puts "----------------------------------------\n"
        puts "bundle install\n"
        puts "rails generate turbolog:config\n"
        puts "----------------------------------------\n"
      end
    end
  end
end
