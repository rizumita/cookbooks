node[:deploy].each do |application, deploy|
  execute "cd #{deploy[:deploy_to]}/current && root php oil refine install"
  execute "cd #{deploy[:deploy_to]}/current && root php oil refine migrate"
end

#node[:deploy].each do |application, deploy|
#  template "#{deploy[:deploy_to]/fuel/app/bootstrap.php" do 
#  end
#end
