require 'forwardable'

module ToyRobot
  class Parser
    def initialize(engine)
      @engine = engine
    end

    PLACE_REGEX = /place *([0-9]+) *, *([0-9]+) *, *(north|east|south|west)/
    def perform(input)
      @message = "OK."
      input.downcase!
      if ['left', 'right', 'move'].include?(input)
        @engine.send(input.to_sym)
        return true
      end
      if input == 'report'
        @message = @engine.report.join(', ')
        return true
      end
      if match = PLACE_REGEX.match(input)
        x, y, h = match.captures
        @engine.place(x.to_i, y.to_i, h.to_sym)
        return true
      end
      @message = "Invalid command."
      false
    rescue => e
      @message = e.message
      false
    end

    attr_accessor :message
  end
end
