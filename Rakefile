#!/usr/bin/env rake

class RakeArgumentRequiredError < Exception
  def initialize(arg_name)
    message = "Rake argument is required: #{arg_name}"
    super(message)
  end
end

task :backup, :trigger, :environment do |task, args|
  root_path = '/Users/mike/.backup'
  trigger = args[:trigger]

  raise RakeArgumentRequiredError.new('trigger') unless trigger

  trigger_path = File.join(root_path, trigger)

  FileUtils.mkdir_p(trigger_path)

  puts `bundle exec backup perform --trigger #{trigger} --config-file=#{trigger}/config.rb # --data-path=$TRIGGER_PATH/data --tmp-path=#{trigger_path}/tmp --log-path=#{trigger_path}/log --cache-path=#{trigger_path}/cache`
end

task :install, :environment do |task, args|
  puts `whenever --load-file schedule.rb`
  puts `whenever --load-file schedule.rb --write-crontab`
end
