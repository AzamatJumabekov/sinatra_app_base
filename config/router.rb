# frozen_string_literal: true

require 'rack/mount'

SinatraApp = Rack::Mount::RouteSet.new do |set|
  set.add_route HomeController, path_info: %r{^/$}
end
