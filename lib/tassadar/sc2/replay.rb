require 'tassadar/sc2/reverse_string'
require 'tassadar/sc2/serialized_data'
require 'tassadar/sc2/attributes'
require 'tassadar/sc2/details'
require 'tassadar/sc2/player'
require 'tassadar/sc2/game'

module Tassadar
  module SC2
    class Replay
      attr_accessor :mpq, :attributes, :details, :players, :game

      def initialize(filename, data=nil)
        @mpq = MPQ::MPQ.read(data.nil? ? File.read(filename) : data)
        @attributes = Attributes.read(@mpq.read_file("replay.attributes.events"))
        @details = Details.read(@mpq.read_file("replay.details"))

        @players = @details.data[0].map {|h| Player.new(h, @attributes.attributes)}
        @players.map{|p| p.gateway = @details.data[10][0][6..7]}
        @game = Game.new(self)
      end
    end
  end
end
