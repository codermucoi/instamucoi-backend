# frozen_string_literal: true

module ResponseHandler
  def render_data(data, status: :ok)
    render json: { data: data }, status: status
  end
end
