namespace :camps do
  desc "Restart camp"
  task :restart do
    `re --all`
  end

  desc "Stop camp"
  task :stop do
    `re --all stop`
  end

  desc "Start camp"
  task :start do
    `re --all start`
  end
end
