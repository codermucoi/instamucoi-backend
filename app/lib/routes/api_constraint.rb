# frozen_string_literal: true

module Routes
  class ApiConstraint
    attr_reader :version, :default

    def initialize(version:, default: false)
      @version = version
      @default = default
    end

    def matches?(request)
      request.headers[:accept]&.include?("application/vnd.instamucoi.v#{version}+json") || default
    end
  end
end
