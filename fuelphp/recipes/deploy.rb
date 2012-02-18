node[:deploy].each do |application, deploy|
  `cd #{deploy[:deploy_to]}/current && php oil refine install`
  `cd #{deploy[:deploy_to]}/current && php oil refine migrate`
end

node[:deploy].each do |application, deploy|
  template "#{deploy[:deploy_to]/fuel/app/bootstrap.php" do 
  end
end
