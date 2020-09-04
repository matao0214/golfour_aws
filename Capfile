require 'capistrano/setup'
require 'capistrano/deploy'
require 'capistrano/scm/git'
install_plugin Capistrano::SCM::Git
require 'capistrano/rbenv'
require 'capistrano/bundler'
require 'capistrano/rails/assets'
require 'capistrano/rails/migrations'
# taskを記述したファイルを読み込むよう設定。場所と拡張子を指定。
Dir.glob('lib/capistrano/tasks/*.rake').each { |r| import r }
