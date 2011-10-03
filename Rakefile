#!/usr/bin/env rake

class RakeArgumentRequiredError < Exception
  def initialize(arg_name)
    message = "Rake argument is required: #{arg_name}"
    super(message)
  end
end

task :backup, :system, :environment do |task, args|
  root_path = '/Users/mike/.backup'
  system = args[:system]

  raise RakeArgumentRequiredError.new('system') unless system

  system_path = File.join(root_path, system)

  FileUtils.mkdir_p(system_path)

  puts `bundle exec backup perform --trigger #{system} --config-file=systems/#{system}.rb # --data-path=#{system_path}/data --tmp-path=#{system_path}/tmp --log-path=#{system_path}/log --cache-path=#{system_path}/cache`
end

task :install, :environment do |task, args|
  puts `whenever --load-file schedule.rb`
  puts `whenever --load-file schedule.rb --write-crontab`
end
