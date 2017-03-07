require 'recastai'

require_relative './config'
require_relative './message'

def bot(body, response)
  connect = RecastAI::Connect.new(Config::RECAST[:token])

  connect.connect.handleMesage({ body: body }, response, method(:reply_message))
end
