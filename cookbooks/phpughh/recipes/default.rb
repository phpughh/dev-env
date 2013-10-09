execute "install ruby1.9.1" do
  command "apt-get -y install ruby1.9.1"
  not_if do
    File.exists?("/var/opt/if-phpughh-installed")
  end
  user "root"
  action :run
end

execute "install ruby1.9.1-dev" do
  command "apt-get -y install ruby1.9.1-dev"
  not_if do
    File.exists?("/var/opt/if-phpughh-installed")
  end
  user "root"
  action :run
end

execute "install make" do
  command "apt-get -y install make"
  not_if do
    File.exists?("/var/opt/if-phpughh-installed")
  end
  user "root"
  action :run
end

execute "install jekyll" do
  command "gem install jekyll"
  not_if do
    File.exists?("/var/opt/if-phpughh-installed")
  end
  user "root"
  action :run
end

# set a lock so the installation routine is only executed
# while the maschine is built
execute "set lock file" do
  command "touch /var/opt/if-phpughh-installed"
  user "root"
  action :run
end

# DOES NOT WORK NEED TO CHECK WHAT CAUSES THE ISSUE LATER
# so far just execute the command manually as root

#execute "start jekyll" do
#  command "jekyll serve --port 80 --watch --detach --source /var/www/phpughh.github.com"
#  user "root"
#  action :run
#end
