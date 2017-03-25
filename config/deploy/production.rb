server '54.92.21.164', user: 'app', roles: %w{app db web}
set :ssh_options, keys: 'Users/akihiro/.ssh/id_rsa'
