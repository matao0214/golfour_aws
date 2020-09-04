# EC2サーバーのIP、EC2サーバーにログインするユーザー名、サーバーのロールを記述
server '54.150.171.208', user: 'yuki', roles: %w[app db web]

# CircleCIによる自動デプロイ前はこちらを採用
# set :ssh_options, keys: '~/.ssh/go_key_rsa'

# CircleCIのGUIで設定した環境変数を使ってSSH接続
set :ssh_options, {
  keys: [ENV.fetch('PRODUCTION_SSH_KEY').to_s],
  forward_agent: true,
  auth_methods: %w[publickey]
}
