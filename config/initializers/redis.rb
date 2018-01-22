if Rails.env.test? || Rails.env.development?
  $redis = Redis::Namespace.new("service_api", :redis => Redis.new)
else
  uri = URI.parse ENV['REDISTOGO_URL']
  _redis = Redis.new(host: uri.host, port: uri.port, password: uri.password, db: uri.query)
#   Redis.current = _redis
#   Redis::Objects.redis = _redis
  $redis = _redis
end
