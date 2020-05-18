require 'sinatra/base'

require_relative './lib/api.rb'

class App < Sinatra::Base
  configure do
    API.load!(self, './api')
  end
end
