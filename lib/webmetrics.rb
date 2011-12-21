require 'digest/sha1'

module Webmetrics

  class Request

    def initialize(options = {})
      @errors = []
      defaults = {
        format: 'json'
      }
      %w{method api_key username}.each do |req|
        unless options.keys.include? req.intern
          @errors.push "#{req} is required."
        end
      end

      @options = defaults.merge options

    end

    def query_string
      params = ''
      stack = []

      @options.each do |k, v|
        params << "#{k}=#{v}&"
      end

      params.chomp
    end

    def valid?
      !@errors.any?
    end

    private # ----------------------------

    def create_hash
      ''
    end

    def create_signature
      ''
    end

  end
end
