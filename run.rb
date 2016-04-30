#!/usr/bin/env ruby
require './lib/messenger'

messenger = Messenger.new
command = $stdin.gets

while command
  output = messenger.execute(command)
  puts output if output
  command = $stdin.gets
end
