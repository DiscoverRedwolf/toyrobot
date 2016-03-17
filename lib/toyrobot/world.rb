module ToyRobot
  class World
    def initialize(width, height)
      @width, @height = width, height
    end

    def valid?(x, y)
      (0...@width).include?(x) && (0...@height).include?(y)
    end
  end
end
