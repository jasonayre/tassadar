require 'spec_helper'

describe Tassadar::SC2::League do

  context 'HOTS NA SC2 Replay', :vcr do
    let(:replay) { Tassadar::SC2::Replay.new(File.join(REPLAY_DIR+"/hots/", "StarStation1.SC2Replay"), nil, with_rankings: true) }
    subject  { replay.players.first.leagues.first }
    
    it "should have url" do
      subject.url.should == "http://us.battle.net/sc2/en/profile/484096/1/Thrice/ladder/141748#current-rank"
    end
    
    it "should have gametype" do
      subject.gametype.should == "1v1"
    end
    
    it "should have level" do
      subject.level.should == "Gold"
    end
    
    it "should have rank" do
      subject.rank.should == "46"
    end
    
  end

end