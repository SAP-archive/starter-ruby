# server.rb
require 'sinatra'

require_relative './bot'

get '/' do
  bot(request.body, response)
end
