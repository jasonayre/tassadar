require 'spec_helper'

describe Tassadar::SC2::Game do
  before(:each) do
    @replay = Tassadar::SC2::Replay.new(File.join(REPLAY_DIR, "patch150.SC2Replay"))
  end

  it "should have players" do
    @replay.players.should be_true
  end
  
  it "should have game" do
    @replay.game.should be_true
  end
  
  it "should have details" do
    @replay.details.should be_true
  end

end
