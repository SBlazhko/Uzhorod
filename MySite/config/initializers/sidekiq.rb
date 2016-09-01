shedule_file = "config/shedule.yml"

Sidekiq::Cron::Job.load_from_hash YAML.load_file(shedule_file)[Rails.env]