require 'forwardable'

module ToyRobot
  class Engine
    extend Forwardable

    def initialize(width: 5, depth: 5)
      @world = World.new(width, depth)
      @robot = nil
    end
    
    def place(x:, y:, h:)
      raise unless @robot.nil?
      @robot = Robot.new(@world)
      @robot.place(x, y, h)
    end

    def_delegators :left, :right, :move, :report, :robot
  end
end
