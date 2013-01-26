message_queue: rabbitmq-server
ui_front: subcontract --chdir ../ui-front -- bin/devserver
auth_service: subcontract --rvm --with-rubies default-with-rvmrc do --chdir ../auth-service -- /usr/bin/env BUNDLE_GEMFILE=../auth-service/Gemfile bundle exec rails s -p 3001 1> /dev/null
ui_service: subcontract --rvm --with-rubies default-with-rvmrc do --chdir ../ui-service -- /usr/bin/env BUNDLE_GEMFILE=../ui-service/Gemfile bundle exec rails s -p 3002 1> /dev/null
auth_service_log: tail -f ../auth-service/log/development.log
ui_service_log: tail -f ../ui-service/log/development.log