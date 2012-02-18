node[:deploy].each do |application, deploy|
  `cd #{deploy[:current_path]} && sudo php oil refine install`
  `cd #{deploy[:current_path]} && sudo php oil refine migrate`

  #execute "oil refine install" do
  #  cwd deploy[:current_path]
  #  command "sudo php oil refine install"
  #  action :nothing
  #end
  #
  #execute "oil refine migrate" do
  #  cwd deploy[:current_path]
  #  command "sudo php oil refine migrate"
  #  action :nothing
  #end

  #template "#{deploy[:deploy_to]}/shared/config/search.yml" do
  #  source "search.yml.erb"
  #  variables(:hosts => node[:scalarium][:roles][:search][:instances].keys)
  #  mode "0660"
  #  group deploy[:group]
  #  owner deploy[:user]
  #  notifies :run, resources(:execute => "restart Rails app #{application}")
  #  only_if { File.exists?("#{deploy[:deploy_to]}/shared/config/") }
  #end
end

#node[:deploy].each do |application, deploy|
#  template "#{deploy[:deploy_to]/fuel/app/bootstrap.php" do 
#  end
#end
