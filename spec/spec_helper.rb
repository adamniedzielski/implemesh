require "bundler"
Bundler.setup(:default, :development)

require "implemesh"
require "rspec"

Dir[File.expand_path("../support/*", __FILE__)].each {|f| require f}

RSpec.configure do |config|
  config.order = "random"
end