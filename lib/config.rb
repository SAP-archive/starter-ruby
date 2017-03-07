module Config
  RECAST = {
    token: ENV['RECAST_TOKEN'] || 'my_token',
    language: ENV['RECAST_LANGUAGE'] || 'en'
  }.freeze
end
