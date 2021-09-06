class Rack::Attack
  Rack::Attack.cache.store = ActiveSupport::Cache::MemoryStore.new

  safelist('Allow-trafic-local') do |req|
    req.ip == '127.0.0.1' || req.ip == '::1'
  end

  throttle('req/ip', limit: 5, period: 5) do |req|
    req.ip
  end

  self.throttled_response = ->(env) {
    retry_after = (env['rack.attack.match_data'] || {})[:period]
    [
      429,
      { 'Content-Type' => 'application/json', 'retry_after' => retry_after.to_s },
      [{ error: 'Throttle limit reached. Retry later' }.json]
    ]
  }
end
