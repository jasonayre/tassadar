require 'spec_helper'

describe Tassadar::SC2::Game do
  context 'NA Patch150 Replay' do
    
    before(:each) do
      @replay = Tassadar::SC2::Replay.new(File.join(REPLAY_DIR, "patch150.SC2Replay"))
    end
    
    it "should set the winner" do
      @replay.game.winner.name.should == "Ratbaxter"
    end

    it "should set the map" do
      @replay.game.map.should == "Scorched Haven"
    end

    it "should set the time" do
      #@replay.game.time.should == Time.new(2012, 8, 2, 11, 00, 33, "-05:00")
    end

    it "should set the speed" do
      @replay.game.speed.should == "Faster"
    end

    it "should set the game type" do
      @replay.game.type.should == "2v2"
    end

    it "should set the category" do
      @replay.game.category.should == "Ladder"
    end
  end

  context 'HOTS NA SC2 Replay' do
    let(:replay) { Tassadar::SC2::Replay.new(File.join(REPLAY_DIR+"/hots/", "StarStation1.SC2Replay")) }
    # subject  { replay.players.first }
    
    it "should have a season" do
      replay.game.season.should == "S2"
    end
    
    it "shoud specify gateway" do
      replay.game.gateway.should == "US"
    end

    # it "should set the id" do
    #   subject.id.should == 484096
    # end
    
  end
end
