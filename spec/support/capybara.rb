# circleciでSysetemSpec実行するためにコメントアウト。
# この設定の中にエラーの原因があるが詳細不明。調査中。
# 参考文献: https://qiita.com/suketa/items/d783ac61c2a3e4c16ad4

# require 'capybara/rspec'

# RSpec.configure do |config|
#   config.before(:each, type: :system) do
#     driven_by :selenium, using: :headless_chrome, options: {
#       browser: :remote,
#       url: ENV.fetch('SELENIUM_DRIVER_URL'),
#       desired_capabilities: :chrome
#     }
#     Capybara.server_host = 'web'
#     Capybara.app_host = 'http://web'
#   end
# end
