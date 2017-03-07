# server.rb
require 'sinatra'

require_relative './bot'

get '/' do
  bot(request, response)
end
