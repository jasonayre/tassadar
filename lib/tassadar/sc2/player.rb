require 'tassadar'
require 'tassadar/sc2/league'
module Tassadar
  module SC2
    class Player
      
      attr_accessor :name, :id, :won, :color, :chosen_race, :actual_race, :handicap, :team, 
      :gateway, :bnet_url, :ladder_url, :league, :leagues

      def initialize(details_hash, attributes)
        @name = details_hash[0]
        @id = details_hash[1][4]
        @won = [false, true, false][details_hash[8]]
        @color = {:alpha => details_hash[3][0], :red => details_hash[3][1], :green => details_hash[3][2], :blue => details_hash[3][3]}
        races = {"Terr" => "Terran", "Prot" => "Protoss", "Zerg" => "Zerg", "RAND" => "Random"}
        @chosen_race = races[attributes.select {|a| a.id == 0x0BB9 && a.player_number == details_hash[7] + 1}.first.attribute_value]
        @actual_race = details_hash[2]
        @handicap = details_hash[6]
        @team = details_hash[5]
      end

      def winner?
        @won
      end
      
      def bnet_url
        @bnet_url ||= "http://#{gateway.downcase}.battle.net/sc2/en/profile/#{id}/1/#{name}/"
      end
      
      def ladder_url
        @ladder_url ||= "#{bnet_url}ladder/leagues#current-rank"
      end
      
      def crawl_ranking_data
        response = HTTParty.get(ladder_url)
        response_html = Nokogiri::HTML(response.body)
        meta = response_html.at_css("#profile-right .data-label").inner_html.split("</span>")
        season = meta.first.split(" <span>").first.strip
        league = meta[1].split("<span>").first.strip.split(" ").last
        gametype = meta[1].split("<span>").first.strip.split(" ").first
        division_name = meta[1].split("<span>").last.strip.gsub!("Division ", "")
        
        leagues_html = response_html.at_css("#profile-menu")
        
        @leagues = leagues_html.search(".submenu a").map do |node|
          league_url = "#{bnet_url}ladder/#{node[:href]}"
          league_detail = node.text.split("Rank").first
          league_gametype = league_detail.split(" ").first
          league_level = league_detail.split(" ").last
          league_rank = node.text.split("Rank").last.strip
          league = League.new(url: league_url, gametype: league_gametype, level: league_level, rank: league_rank)
        end
      end
            
    end
  end
end
