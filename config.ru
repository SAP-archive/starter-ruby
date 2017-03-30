# coding: utf-8

require 'figaro'
require 'sinatra'

require_relative 'lib/bot'

set :port, ENV['PORT']

post '/' do
  bot(request)
end

run Sinatra::Application
