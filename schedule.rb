every 4.hours do
  backup_script = File.expand_path("../bin/backup.sh", __FILE__)
  command  "#{backup_script} sharleena"
end
