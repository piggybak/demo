namespace :db do
 desc "Drop, create, migrate, and seed database. Clear cache.  Restart camp."

  task :rebuild => [
    'environment',
    'db:no_production_check',
    'camps:restart',
    'db:drop',
    'db:create',
    'db:migrate',
    'db:seed',
    'tmp:clear',
    'camps:restart'
  ]

  task :no_production_check do
    raise "Never run this in production!" if Rails.env == "production"
  end
end
