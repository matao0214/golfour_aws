# EC2サーバーのIP、EC2サーバーにログインするユーザー名、サーバーのロールを記述
server '54.150.171.208', user: 'yuki', roles: %w[app db web]

# デプロイするサーバーにsshログインする鍵の情報を記述
set :ssh_options, keys: '~/.ssh/go_key_rsa'
