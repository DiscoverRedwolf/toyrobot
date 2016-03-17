module ToyRobot
  class Robot
    def initialize(world)
      @world = world
      @spawned = false
    end

    def place(x, y, h)
      raise unless @world.valid?(x, y)
      @x, @y = x, y
      @spawned = true
    end

    def move
      raise unless spawned
      raise unless @world.valid?(@x + @dx, @y + @dy)
      @x += @dx
      @y += @dy
    end

    def left
      raise unless spawned
      @dx, @dy = -@dy, @dx
    end

    def right
      raise unless spawned
      @dx, @dy = @dy, -@dx
    end

    def report
      raise unless spawned
      [@x, @y, _get_heading]
    end

    private

    HEADINGS = {
      north: [0, 1],
      east: [1, 0],
      south: [0, -1],
      west: [-1, 0]
    }

    def _set_delta(h)
      raise unless HEADINGS.key?(h)
      @dx, @dy = HEADINGS[h]
    end

    def _get_heading
      raise unless HEADINGS.invert[[@dy, @dy]]
    end
  end
end
