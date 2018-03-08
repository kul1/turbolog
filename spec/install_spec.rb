
require 'spec_helper'

describe Turbolog do

  describe 'Step 1 – Add Gems to your Gemfile' do
        # gem 'devise'
        # gem 'mongo', '~> 2.2'
        # gem 'bson', '~> 4.0'
        # gem 'mongoid', github: 'mongodb/mongoid'
        # gem 'nokogiri'
        # gem 'haml', git: 'https://github.com/haml/haml'
        # gem 'haml-rails'
        # gem 'bcrypt'
        # gem 'omniauth-identity'
        # gem 'omniauth-facebook'
        # gem 'dotenv-rails'
    it 'require \'devise\' returns a hash of the passed data' do
      gem 'devise'
      #require 'devise'
      expect(require 'devise').not_to be_nil
    end

    it 'require \'mongo\', \'~> 2.2\' returns a hash of the passed data' do
      gem 'mongo', '~> 2.2'
      expect(require 'mongo').not_to be_nil
    end

    it 'require \gem \'bson\', \'~> 4.0\' returns a hash of the passed data' do
      gem 'bson', '~> 4.0'
      expect(require 'bson').not_to be_nil
    end

    it 'require mongoid\', github: \'mongodb/mongoid returns a hash of the passed data' do
      gem 'mongoid', github: 'mongodb/mongoid'
      expect(require 'mongoid').not_to be_nil
    end

    it 'require gem \'nokogiri\' returns a hash of the passed data' do
      gem 'nokogiri'
      expect(require 'nokogiri').not_to be_nil
    end

    it 'require gem \'haml\', git: \'https://github.com/haml/haml\' returns a hash of the passed data' do
      gem 'haml', git: 'https://github.com/haml/haml'
      expect(require 'haml').not_to be_nil
    end

    it 'require gem \'haml-rails\' returns a hash of the passed data' do
      gem 'haml-rails'
      expect(require 'haml-rails').not_to be_nil
    end

    it 'require gem \'bcrypt\' returns a hash of the passed data' do
      gem 'bcrypt'
      expect(require 'bcrypt').not_to be_nil
    end

    it 'require gem \'omniauth-identity\' returns a hash of the passed data' do
      gem 'omniauth-identity'
      expect(require 'omniauth-identity').not_to be_nil
    end

    it 'require gem \'omniauth-facebook\' returns a hash of the passed data' do
      gem 'omniauth-facebook'
      expect(require 'omniauth-facebook').not_to be_nil
    end

    it 'require gem \'dotenv-rails\' returns a hash of the passed data' do
      gem 'dotenv-rails'
      expect(require 'dotenv-rails').not_to be_nil
    end

end
  #   it 'All about gems' do
  #     pending
  #   end
  # end  

  # describe 'Step 2 – Backup' do
  #    # Rails.application.routes.draw do
  #    #   resources :posts
  #    #   root 'posts#index'
  #    # end
  #   it 'returns a hash of the passed data' do
  #     pending
  #   end  
  # end


  # describe 'Step 3 – Add Functionality to your App' do
		#  # Rails.application.routes.draw do
		#  #   resources :posts
		#  #   root 'posts#index'
		#  # end
  #   it 'returns a hash of the passed data' do
  #     pending
  #   end  
  # end
  # describe 'Step 4 Configure Devise' do

		# # rails generate devise:install
		# # rails generate devise User
		# # rake de:migrate

  #   it 'returns a hash of the passed data' do
  #     pending
  #   end 

		# # class ApplicationController < ActionController::Base
		# #   protect_from_forgery with: :exception
		# #   before_action :authenticate_user!
		# # end
  #   it 'Edit ApplicationController to :authenticate_user' do
  #     pending
  #   end  
  # end

  # describe 'Step 5 Add OmniAuth Capability to User Model' do

		# # rails g migration AddOmniauthToUsers provider:index uid:index 
		# # rake db:migrate

  #   it 'returns a hash of the passed data' do
  #     pending
  #   end 
  # end
  # describe 'Step 6 Add OmniAuth Configuration to initializer' do

		# # Go into config/initializers/devise.rb and under the omniAuth section add:
		# # config.omniauth :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET']

  #   it 'returns a hash of the passed data' do
  #     pending
  #   end 
  # end
  # describe 'Step 7 – Enable a Route for Omniauth' do

		# # Add this to routes.rb to tell create a route for Omniauth to send its authentication data to:
		# # devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  #   it 'returns a hash of the passed data' do
  #     pending
  #   end 
  # end
  # describe 'Step 8 – Enable Omniauth for User Model' do

		# # Add this line to user.rb
		# # devise :omniauthable, :omniauth_providers => [:facebook]

  #   it 'returns a hash of the passed data' do
  #     pending
  #   end 
  # end
  # describe 'Step 9 – Add a Controller to Handle the Callback' do

		# # class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
		# #   def facebook
		# #      @user = User.from_omniauth(request.env["omniauth.auth"])
		# #      sign_in_and_redirect @user      
		# #   end
		# # end
  #   it 'returns a hash of the passed data' do
  #     pending
  #   end
		# # We have to write a method in our ApplicationController:

		# # def after_sign_in_path_for(resource)
		# #     request.env['omniauth.origin'] || root_path
		# # end

  #   it 'returns a hash of the passed data' do
  #     pending
  #   end
  #
end


