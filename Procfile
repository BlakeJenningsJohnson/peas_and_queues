resque: env TERM_CHILD=1 QUEUE=* bundle exec rake resque:work

worker: env RESQUE_TERM_TIMEOUT=7 TERM_CHILD=1 VVERBOSE=1 QUEUE=* bundle exec rake resque:work