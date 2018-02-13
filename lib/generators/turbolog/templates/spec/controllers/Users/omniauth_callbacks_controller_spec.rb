# -*- encoding: utf-8 -*-

require 'rails_helper'
require './app/controllers/Users/omniauth_callbacks_controller'

describe Users::OmniauthCallbacksController do

  # TODO: auto-generated
  describe '#facebook' do
    xit 'works' do
      omniauth_callbacks_controller = Users::OmniauthCallbacksController.new
      result = omniauth_callbacks_controller.facebook
      expect(result).not_to be_nil
    end
  end

end
