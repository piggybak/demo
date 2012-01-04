namespace :resque do
  desc "Kill resque"
  task :kill do
    if File.exist?("#{Rails.root}/var/run/resque-work.pid")
      pid = File.read("#{Rails.root}/var/run/resque-work.pid").to_i
      while Process.kill(0, pid) do
        #Process.kill(9, pid)
        `kill #{pid}`
        sleep(2)
      end
      File.delete("#{Rails.root}/var/run/resque-work.pid")
    end
  end
end
