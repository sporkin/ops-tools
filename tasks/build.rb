require 'fileutils'

# 1. move to ../release/ui-front
# 2. pull
# 3. branch release id
# 4. remove Gemfile, Gemfile.lock, Procfile
# 5. add production Procfile
# 6. add heroku remote git repo
# 7. git push heroku

base_url = "#{ENV['PWD']}/../../"
FileUtils.rm_r "#{base_url}release/ui-front", :force => true
v = "0.0.4"

branch_name = "release_#{v}"
FileUtils.cd('../../release/') do
  puts %x{ git clone git@github.com:sporkin/ui-front.git }
  FileUtils.cd('ui-front') do
    puts %x{ git branch #{branch_name} }
    puts %x{ git checkout #{branch_name} }
    FileUtils.rm %w( Gemfile Gemfile.lock Procfile ), :force => true
    FileUtils.cp('../../ops-tools/production_configs/Procfile.example', 'Procfile')
    puts %x{ git add . }
    puts %x{ git rm Gemfile Gemfile.lock }
    puts %x{ git commit -am 'deploy test' }
    puts %x{ heroku git:remote -a staging-ui-front }
    puts %x{ git push heroku #{branch_name}:master -f }
  end
end
