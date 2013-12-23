require 'net_buildpack/base_component'
require 'net_buildpack/container'
require 'net_buildpack/container/container_utils'

module NETBuildpack::Container
  class AspNet < NETBuildpack::BaseComponent

    # Encapsulates the detect, compile, and release functionality for applications running an Asp.net application.
    # Currently Mono supports MVC 3, but 4 is tricky to get working.

    def initialize(context = {})
      super("#{CONTAINER_NAME} container", context)
    end

    # Detects whether this application is an asp.net application.
    #
    # @return [String] returns +asp-net+ if an asp.net site is found in the project folder
    def detect
    end

    # Builds and publishes the site
    #
    # @return [void]
    def compile
    end

    # Creates the string to run the asp.net site, creates the vhost config, and stages it into the appropriate vendor location.
    #
    # @return [String] the command to run the application.
    def release
      @start_script[:run] = start_run_script
    end

    private

    ARGUMENTS_PROPERTY = 'arguments'.freeze
    CONTAINER_NAME = 'asp.net'.freeze

    def arguments
      @configuration[ARGUMENTS_PROPERTY]
    end
  end
end