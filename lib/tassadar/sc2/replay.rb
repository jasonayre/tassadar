

module Tassadar
  module SC2
    class Replay
      attr_accessor :mpq, :attributes, :details, :players, :game, :options
      
      def initialize(filepath, *args)
        @options ||= args.extract_options!
        @mpq = MPQ::MPQ.read(File.read(filepath))
        @attributes = Attributes.read(@mpq.read_file("replay.attributes.events"))
        @details = Details.read(@mpq.read_file("replay.details"))
        @players = @details.data[0].map {|h| Player.new(h, @attributes.attributes)}
        @players.map{|p| p.gateway = @details.data[10][0][6..7]}
        @players.map{|p| p.crawl_ranking_data } if @options.has_key?(:with_rankings)
        @game = Game.new(self, @players)
        @game.determine_league if @options.has_key?(:with_rankings)
      end
      
    end
  end
end
