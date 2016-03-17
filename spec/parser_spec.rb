require 'spec_helper'

RSpec.describe ToyRobot::Parser do
  it "detects invalid commands" do
    parser = ToyRobot::Parser.new(ToyRobot::Engine.new)
    expect(parser.perform("foo")).to be(false)
    expect(parser.message).to eq("Invalid command.")
  end

  it "gives an error if the robot is not placed" do
    parser = ToyRobot::Parser.new(ToyRobot::Engine.new)
    expect(parser.perform("move")).to be(false)
    expect(parser.message).to eq("Robot not placed.")
  end

  it "does not allow placement out of bounds" do
    parser = ToyRobot::Parser.new(ToyRobot::Engine.new)
    expect(parser.perform("place 5, 5, east")).to be(false)
    expect(parser.message).to eq("Out of bounds.")
  end

  it "does not allow movement out of bounds" do
    parser = ToyRobot::Parser.new(ToyRobot::Engine.new)
    expect(parser.perform("place 4, 3, east")).to be(true)
    expect(parser.perform("move")).to be(false)
    expect(parser.message).to eq("Would move out of bounds.")
  end

  it "can control the robot" do
    parser = ToyRobot::Parser.new(ToyRobot::Engine.new)
    expect(parser.perform("place 1, 1, east")).to be(true)
    expect(parser.perform("move")).to be(true)
    expect(parser.perform("move")).to be(true)
    expect(parser.perform("report")).to be(true)
    expect(parser.message).to eq("3, 1, east")
    expect(parser.perform("left")).to be(true)
    expect(parser.perform("move")).to be(true)
    expect(parser.perform("report")).to be(true)
    expect(parser.message).to eq("3, 2, north")
  end
end
