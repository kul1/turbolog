require 'turbolog/helpers'
module Turbolog
  module Generators
    class InstallGenerator < Rails::Generators::Base
      desc "Install Turbolog component to existing Rails app "
      def self.source_root
        File.dirname(__FILE__) + "/templates"
      end

      def setup_gems
        puts Color.blue(" ....................Insert Gems....................\n")
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
          gem 'simplecov'
          gem 'faker', :git => 'https://github.com/stympy/faker.git', :branch => 'master'
          gem 'database_cleaner'
        end
      end

      def backup_files
        puts Color.blue(" ...................Backup Filess....................\n")
        inside("app/controllers") {(File.file? "Users/omniauth_callbacks_controller.rb") ? (run "mv omniauth_callbacks_controller.rb omniauth_callbacks_controller.rb.bak") : (puts "No omniauth_callbacks_controller.rb")}
        inside("config/initializers") {(File.file? "devise.rb") ? (run "mv devise.rb devise.rb.bak") : (puts "No devise.rb")}
        inside("app/models") {(File.file? "user.rb") ? (run "mv user.rb user.rb.bak") : (puts "No user.rb")}
        inside("app/views/layouts") {(File.file? "application.html.erb") ? (run "cp application.html.erb application.html.erb.bak") : (puts "No application.html.erb")}
        inside("config") {(File.file? "routes.rb") ? (run "cp routes.rb routes.rb.bak") : (puts "No routes.rb")}
        directory "app"
      end
      def remove_devise
        puts Color.blue(" ..............Remove devise from routes.............\n")
        gsub_file 'config/routes.rb',/devise_for.*\n/,''
      end
      def create_welcome
        puts Color.blue(" ................Create Sample: Welcome..............\n")
        run "rails g scaffold welcome greeting:text"
      end


      def finish
        puts "\n"
        puts Color.blue(" ....................Finish Step 1/3..................\n")
        puts "Next: Please run the following command:\n"
        puts Color.blue("......................................................\n")
        puts "$ bundle install\n"
        puts "$ rails generate turbolog:config\n"
        puts Color.blue("......................................................\n")
      end
    end
  end
end
