# coding: utf-8

require 'recastai'

def bot(payload)
  connect = RecastAI::Connect.new(ENV['request_token'], ENV['language'])
  request = RecastAI::Request.new(ENV['request_token'])

  connect.handle_message(payload) do |message|
    response = request.converse_text(message.content, conversation_token: message.sender_id)

    replies = response.replies.map{ |r| { type: 'text', content: r } }
    connect.send_message(replies, message.conversation_id)
  end

  200
end
