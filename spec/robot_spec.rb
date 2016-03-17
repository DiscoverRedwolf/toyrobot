require 'spec_helper'

RSpec.describe ToyRobot::Robot do
  it "can be placed in the world" do
    robot = ToyRobot::Robot.new(ToyRobot::World.new(5, 5))
    robot.place(1, 1, :east)
    expect(robot.report).to eq([1, 1, :east])
  end

  it "cannot be placed in an invalid position" do
    robot = ToyRobot::Robot.new(ToyRobot::World.new(5, 5))
    expect { robot.place(0, 0, :east) }.to_not raise_error
    expect { robot.place(-1, 1, :east) }.to raise_error
    expect { robot.place(4, 3, :east) }.to_not raise_error
    expect { robot.place(4, 5, :east) }.to raise_error
  end

  it "can move in the world" do
    robot = ToyRobot::Robot.new(ToyRobot::World.new(5, 5))
    robot.place(1, 1, :north)
    robot.move
    robot.move
    expect(robot.report).to eq([1, 3, :north])
  end

  it "cannot move off the world" do
    robot = ToyRobot::Robot.new(ToyRobot::World.new(5, 5))
    robot.place(1, 1, :south)
    expect { robot.move }.to_not raise_error
    expect { robot.move }.to raise_error
    expect(robot.report).to eq([1, 0, :south])
  end

  it "can rotate left" do
    robot = ToyRobot::Robot.new(ToyRobot::World.new(5, 5))
    robot.place(1, 1, :north)
    robot.left
    expect(robot.report).to eq([1, 1, :west])
    robot.left
    expect(robot.report).to eq([1, 1, :south])
    robot.left
    expect(robot.report).to eq([1, 1, :east])
    robot.left
    expect(robot.report).to eq([1, 1, :north])
  end

  it "can rotate right" do
    robot = ToyRobot::Robot.new(ToyRobot::World.new(5, 5))
    robot.place(1, 1, :north)
    robot.right
    expect(robot.report).to eq([1, 1, :east])
    robot.right
    expect(robot.report).to eq([1, 1, :south])
    robot.right
    expect(robot.report).to eq([1, 1, :west])
    robot.right
    expect(robot.report).to eq([1, 1, :north])
  end
end
