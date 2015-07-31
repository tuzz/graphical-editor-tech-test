require "editor"
require "stringio"
require "rspec"

RSpec.configure do |config|
  config.formatter = :doc
  config.color = true
  config.disable_monkey_patching!
end
