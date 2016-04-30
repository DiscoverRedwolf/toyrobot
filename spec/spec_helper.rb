$LOAD_PATH << Pathname.new(__FILE__).parent.parent.join('lib')
require 'messenger'
require 'pry'

RSpec.configure do |config|
  config.order = :random
end
