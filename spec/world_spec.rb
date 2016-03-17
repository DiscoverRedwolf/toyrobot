require 'spec_helper'

RSpec.describe ToyRobot::World do
  it "tests valid position" do
    robot = ToyRobot::World.new(5, 5)
    expect(robot.valid?(0, 0)).to be(true)
    expect(robot.valid?(4, 0)).to be(true)
    expect(robot.valid?(0, 4)).to be(true)
    expect(robot.valid?(4, 4)).to be(true)
    expect(robot.valid?(5, 0)).to be(false)
    expect(robot.valid?(0, 5)).to be(false)
    expect(robot.valid?(-1, -1)).to be(false)
  end
end
