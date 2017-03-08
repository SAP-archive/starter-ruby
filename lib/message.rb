require 'recastai'

require_relative './config'

def reply_message(message)
  text = message.content.attachment.content
  sender_id = message.senderId

  request = RecastAI::Request.new(Config::RECAST[:token])

  result = request.converse_text(text, sender_id)

  result.replies.each do |reply|
    message.addReply(type: 'text', content: reply)
  end

  message.reply
end
