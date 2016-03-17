module ToyRobot
  class Robot
    def initialize(world)
      @world = world
      @spawned = false
    end

    def place(x, y, h)
      raise "Out of bounds." unless @world.valid?(x, y)
      @x, @y = x, y
      _set_delta(h)
      @spawned = true
    end

    def move
      raise "Robot not placed." unless @spawned
      raise "Would move out of bounds." unless @world.valid?(@x + @dx, @y + @dy)
      @x += @dx
      @y += @dy
    end

    def left
      raise "Robot not placed." unless @spawned
      @dx, @dy = -@dy, @dx
    end

    def right
      raise "Robot not placed." unless @spawned
      @dx, @dy = @dy, -@dx
    end

    def report
      raise "Robot not placed." unless @spawned
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
      raise "Invalid heading." unless HEADINGS.key?(h)
      @dx, @dy = HEADINGS[h]
    end

    def _get_heading
      dir = [@dx, @dy]
      raise "Direction error." unless HEADINGS.invert.key?(dir)
      HEADINGS.invert[dir]
    end
  end
end
