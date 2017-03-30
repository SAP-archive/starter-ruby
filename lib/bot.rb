# coding: utf-8

require 'recastai'

def bot(payload)
  connect = RecastAI::Connect.new(ENV['REQUEST_TOKEN'], ENV['LANGUAGE'])
  request = RecastAI::Request.new(ENV['REQUEST_TOKEN'])

  connect.handle_message(payload) do |message|
    response = request.converse_text(message.content, conversation_token: message.sender_id)

    replies = response.replies.map{ |r| { type: 'text', content: r } }
    connect.send_message(replies, message.conversation_id)
  end

  200
end
