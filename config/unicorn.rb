worker_processes 3
timeout 30

@resque_pid = nil
@resque_pid2 = nil

before_fork do |server, worker|
   @resque_pid ||= spawn("bundle exec rake " + \
  "resque:work QUEUES=*")
      @resque_pid2 ||= spawn("bundle exec rake " + \
  "resque:scheduler")
end

