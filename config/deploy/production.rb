# EC2サーバーのIP、EC2サーバーにログインするユーザー名、サーバーのロールを記述
# CircleCIではSSHKEYの登録時にOPENSSH形式は使用不可で、pemファイルを使用しないといけない。
# そのため、これまでgo_key_rsaというOPENSSH形式のファイルを使用していたが、golfourというpem形式のファイルを新たに作成。
server '54.150.171.208', user: 'yuki', roles: %w[app db web]

# 自動デプロイ前はこちらを使用
# set :ssh_options, keys: '~/.ssh/go_key_rsa'

# CircleCIのGUIで設定した環境変数を使ってSSH接続
set :ssh_options, {
  keys: [ENV.fetch('PRODUCTION_SSH_KEY').to_s],
  forward_agent: true,
  auth_methods: %w[publickey]
}
