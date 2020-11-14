# frozen_string_literal: true

module ExceptionHandler
  extend ActiveSupport::Concern

  included do
    rescue_from ActiveRecord::RecordNotFound do |e|
      render_errors(e.message, status: :not_found)
    end

    rescue_from ActiveRecord::RecordInvalid do |e|
      render_errors(e.message, status: :unprocessable_entity)
    end
  end

  protected

  def generate_error(resource)
    if resource.respond_to?(:errors)
      {
        title: resource.errors.full_messages.join(', '),
        details: resource.errors.details
      }
    elsif resource.is_a?(Hash)
      error = resource[:error] || resource[:title]
      {
        title: resource[:title],
        details: { system: [{ error: error }] }
      }
    else # string
      {
        title: resource,
        details: { system: [{ error: resource }] }
      }
    end
  end

  def render_errors(resource, status: :bad_request)
    resources = case resource
                when Array
                  resource
                when Hash
                  [resource]
                else
                  Array(resource)
                end

    errors = resources.map { |r| generate_error(r) }
    render json: { errors: errors }, status: status
  end
end
