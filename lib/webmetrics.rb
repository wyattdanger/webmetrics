require 'rubygems'
require 'cgi'
require 'digest/sha1'
require 'base64'
require 'open-uri'


module Webmetrics

  class API

    attr_accessor :options

    BASE_URL = "https://api.webmetrics.com/v2/"

    def initialize(options = {})
      @options = options

      requires :api_key
      requires :username

    end

    def request (options = {})

      query_string = build_query_string(options)

      open "#{BASE_URL}#{query_string}" do |response|
        yield response
      end

    end

    private 

    def build_query_string(options = {})
      params = '?'
      stack = []

      options[:username] = @options[:username]
      options[:sig]      = signature

      options.each do |k, v|
        params << "#{k}=#{v}&"
      end

      params.chop
    end

    def timestamp
      Time.new().to_i
    end

    def sha1
      Digest::SHA1.digest("#{options[:username]}#{options[:api_key]}#{timestamp}")
    end

    def b64
      Base64.encode64(sha1.to_s.strip).gsub("\n", '')
    end

    def signature
      CGI.escape b64
    end

    def requires(param)
      raise "#{ param } is REQUIRED" unless options.keys.include? param 
    end

  end
end
