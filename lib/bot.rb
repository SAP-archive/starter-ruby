require 'recastai'

require_relative './config'
require_relative './message'

def bot(request, response)
  connect = RecastAI::Connect.new(Config::RECAST[:token])

  connect.connect.handleMesage(request, response, method(:reply_message))
end
