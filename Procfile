web: bundle exec unicorn -p $PORT -c ./config/unicorn.rb
resque: env TERM_CHILD=1 COUNT=2 RESQUE_TERM_TIMEOUT=10 QUEUE=* bundle exec rake resque:workers
exec rake resque:scheduler

