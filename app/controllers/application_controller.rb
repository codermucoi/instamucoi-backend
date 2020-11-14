# frozen_string_literal: true

class ApplicationController < ActionController::API
  include ResponseHandler
  include ExceptionHandler

  before_action :authenticate_and_set_user
end
