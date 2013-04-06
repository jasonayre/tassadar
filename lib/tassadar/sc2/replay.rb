

module Tassadar
  module SC2
    class Replay
      attr_accessor :mpq, :attributes, :details, :players, :game, :options, :data

      def initialize(filepath, *args)
        @options ||= args.extract_options!
        @mpq = MPQ::MPQ.read(File.read(filepath))
        # @mpq = MPQ::MPQ.read(data.nil? ? File.read(filename) : data)
        # @mpq = MPQ::MPQ.read(data.nil? ? File.read(filename) : data)
        @attributes = Attributes.read(@mpq.read_file("replay.attributes.events"))
        @details = Details.read(@mpq.read_file("replay.details"))
        @players = @details.data[0].map {|h| Player.new(h, @attributes.attributes)}
        @players.map{|p| p.gateway = @details.data[10][0][6..7]}
        
        if @options.has_key?(:with_rankings)
          @players.map{|p| p.crawl_ranking_data }
        end
        
        @game = Game.new(self, @players)
        
        if @options.has_key?(:with_rankings)
          @game.determine_league
        end
        
      end
      
    end
  end
end
