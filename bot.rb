# coding: utf-8

require 'recastai'
require 'sinatra'
require_relative 'config.rb'

def bot(payload)
  connect = RecastAI::Connect.new(ENV['REQUEST_TOKEN'], ENV['LANGUAGE'])
  request = RecastAI::Request.new(ENV['REQUEST_TOKEN'])

  connect.handle_message(payload) do |message|
    response = request.analyse_text(message.content)
    intent = response.intents.first

    msg = if intent.nil?
            "I'm sorry but I don't understand what you are talking about"
          else
            "I understand that you talk about #{intent.slug}"
          end

    replies = [{ type: 'text', content: msg }]
    connect.send_message(replies, message.conversation_id)
  end
end

set :port, ENV['PORT']

post '/' do
  bot(request)
  200
end
