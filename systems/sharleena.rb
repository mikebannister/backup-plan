require 'rbrc'

Rbrc::Config.register(:sharleena_backup)

Backup::Model.new(:sharleena, 'General workstation backup') do

  encrypt_with OpenSSL do |encryption|
    encryption.password = Rbrc::Config.sharleena_backup.password
    encryption.base64   = true
    encryption.salt     = true
  end

  store_with CloudFiles do |cf|
    cf.api_key   = Rbrc::Config.sharleena_backup.cloudfiles_api_key
    cf.username  = 'mikebannister'
    cf.container = 'backup'
    cf.path      = '/'
    cf.keep      = 20
  end

  notify_by Mail do |mail|
    mail.on_success           = true
    mail.on_failure           = true

    mail.from                 = 'mike@sharleena'
    mail.to                   = 'mikebannister@gmail.com'
    mail.address              = 'smtp.gmail.com'
    mail.port                 = 587
    mail.domain               = 'gmail.com'
    mail.user_name            = 'mikebannister@gmail.com'
    mail.password             = Rbrc::Config.sharleena_backup.mail_password
    mail.authentication       = 'plain'
    mail.enable_starttls_auto = true
  end

  compress_with Gzip do |compression|
    compression.best = true
    compression.fast = false
  end

  archive :notes do |archive|
    archive.add '/Users/mike/notes'
  end

  archive :work do |archive|
    archive.add '/Users/mike/work'
    archive.exclude '*.log'
    archive.exclude '*.bak*'
    archive.exclude 'tmp'
    archive.exclude 'uploads'
  end

  archive :home do |archive|
    archive.add '/Users/mike/bin'
    archive.add '/Users/mike/projects'
  end
end
