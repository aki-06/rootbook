server '13.113.234.90', user: 'app', roles: %w{app db web}
set :ssh_options, keys: '/Users/akihiro/.ssh/id_rsa'
