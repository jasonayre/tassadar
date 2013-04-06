module Tassadar
  module SC2
    class League
      attr_accessor :url, :gametype, :level, :rank
      
      def initialize(attribs)
        attribs.each_pair do |k,v|
          instance_variable_set("@#{k}", v)
        end
      end
      
    end
  end
end