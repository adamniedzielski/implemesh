require "bundler"
Bundler.setup(:default, :development)

require "implemesh"
require "rspec"

RSpec.configure do |config|
  config.order = "random"
end