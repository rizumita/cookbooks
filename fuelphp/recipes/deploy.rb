include_recipe "deploy::default"

node[:deploy].each do |application, deploy|
# deploy[:deploy_to]
  
  execute "oil refine install" do
    cwd deploy[:current_path]
    user deploy[:user]
    command "php oil refine install"
  end

  template "#{deploy[:current_path]}/fuel/app/bootstrap.php" do
    source "bootstrap.php.erb"
    #variables(:hosts => node[:scalarium][:roles][:search][:instances].keys)
    group deploy[:group]
    owner deploy[:user]
    #only_if { File.exists?("#{deploy[:current_path]}/fuel/app/") }
  end

  #template "#{deploy[:current_path]}/fuel/app/config/production/db.php" do
  #  source "db.php.erb"
  #  #variables(:hosts => node[:scalarium][:roles][:search][:instances].keys)
  #  group deploy[:group]
  #  owner deploy[:user]
  #  #only_if { File.exists?("#{deploy[:current_path]}/fuel/app/") }
  #end
  
  execute "oil refine migrate" do
    cwd deploy[:current_path]
    user deploy[:user]
    command "php oil refine migrate"
  end

end
