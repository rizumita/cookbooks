node[:deploy].each do |application, deploy|
  `cd #{deploy[:deploy_to]}/current && php oil refine install`
  'cd #{deploy[:deploy_to]}/current && php oil refine migrate`
end
