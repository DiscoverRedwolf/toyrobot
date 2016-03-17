require 'forwardable'

module ToyRobot
  class Engine
    extend Forwardable

    def initialize(width: 5, depth: 5)
      @world = World.new(width, depth)
      @robot = Robot.new(@world)
    end

    delegate [:place, :left, :right, :move, :report] => :@robot
  end
end
