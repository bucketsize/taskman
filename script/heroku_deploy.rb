require 'heroku-headless'

HerokuHeadless.configure do | config |
    config.post_deploy_commands = ['rake db:migrate']
    config.pre_deploy_git_commands = ['git log -1']
end

HerokuHeadless::Deployer.deploy( 'floating-sword-1681' )
