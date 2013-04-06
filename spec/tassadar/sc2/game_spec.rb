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

  context 'HOTS NA SC2 Replay', :vcr do
    let(:replay) { Tassadar::SC2::Replay.new(File.join(REPLAY_DIR+"/hots/", "KorhalCity123.SC2Replay"), with_rankings: true) }
    
    it "should have a season" do
      replay.game.season.should == "S2"
    end
    
    it "should specify gateway" do
      replay.game.gateway.should == "US"
    end
    
    it "should have two players" do
      replay.game.players.length.should == 2
    end
    
    it "should have league equal to gold" do
      replay.game.league.should == "Gold"
    end
  end
end
