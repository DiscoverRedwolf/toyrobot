require 'spec_helper'

RSpec.describe ToyRobot::Engine do
  it "can control a robot" do
    engine = ToyRobot::Engine.new
    engine.place(1, 1, :east)
    expect(engine.report).to eq([1, 1, :east])
    engine.move
    engine.move
    expect(engine.report).to eq([3, 1, :east])
    engine.left
    engine.move
    expect(engine.report).to eq([3, 2, :north])
  end
end
