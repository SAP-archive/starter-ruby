module Config
  RECAST = {
    token: ENV['RECAST_TOKEN'] || '',
    language: ENV['RECAST_LANGUAGE'] || ''
  }.freeze
end
