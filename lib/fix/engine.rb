require 'fix/engine/logger'
require 'fix/engine/server'
require 'fix/engine/client_connection'

#
# Main FIX namespace
#
module Fix

  #
  # Main Fix::Engine namespace
  #
  module Engine

    # The default IP on which the server will listen    
    DEFAULT_IP    = '0.0.0.0'

    # The default port on which the server will listen
    DEFAULT_PORT  = 8359

    #
    # Runs a FIX server engine
    #
    def self.run!(ip = DEFAULT_IP, port = DEFAULT_PORT, handler = FE::ServerConnection, &block)
      Server.new(ip, port, handler, &block).run!
    end

    #
    # Alias the +Fix::Engine+ namespace to +FE+ if possible, because lazy is not necessarily dirty
    #
    def self.alias_namespace!
      Object.const_set(:FE, Engine) unless Object.const_defined?(:FE)
    end

  end
end

Fix::Engine.alias_namespace!

