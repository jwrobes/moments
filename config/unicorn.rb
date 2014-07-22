worker_processes 3
timeout 30
preload_app true

before_fork do |server, worker|
   @sidekiq_pid ||= spawn("bundle exec rake " + \
  "resque:work QUEUES=send_texts_every_minute,schedules_moments_at_local_midnight")
end

# before_fork do |server, worker|
#   # Replace with MongoDB or whatever
#   if defined?(ActiveRecord::Base)
#     ActiveRecord::Base.connection.disconnect!
#     Rails.logger.info('Disconnected from ActiveRecord')
#   end
 
#   # If you are using Redis but not Resque, change this
#   if defined?(Resque)
#     Resque.redis.quit
#     Rails.logger.info('Disconnected from Redis')
#   end
# end
 
# after_fork do |server, worker|
#   # Replace with MongoDB or whatever
#   if defined?(ActiveRecord::Base)
#     ActiveRecord::Base.establish_connection
#     Rails.logger.info('Connected to ActiveRecord')
#   end
 
#   # If you are using Redis but not Resque, change this
#   if defined?(Resque)
#     Resque.redis = ENV['REDIS_URI']
#     Rails.logger.info('Connected to Redis')
#   end
# end