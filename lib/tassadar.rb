$:.unshift File.join(File.dirname(__FILE__), 'lib')

require 'tassadar/mpq'

require 'tassadar/sc2/replay'
require 'tassadar/sc2/reverse_string'
require 'tassadar/sc2/serialized_data'
require 'tassadar/sc2/attributes'
require 'tassadar/sc2/details'
require 'tassadar/sc2/player'
require 'tassadar/sc2/game'
require 'tassadar/sc2/league'
require 'active_support/core_ext'
require 'httparty'
require 'nokogiri'


module Tassadar
end
