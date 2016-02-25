module Rainbow
  module Color
    class Whitepoint
      attr_reader :name, :description, :temperature, :reference_2, :reference_10, 
                  :tristimulus_2, :tristimulus_10
      
      def initialize(name, whitepoint)
        @name = name
        @description = whitepoint['note']
        @temperature = whitepoint['cct']
        if (reference = whitepoint['reference'])
          @reference_2    = Chromaticity.new(reference['x2'],  reference['y2'])
          @reference_10   = Chromaticity.new(reference['x10'], reference['y10'])
        end
        if (tristimulus = whitepoint['tristimulus'])
          @tristimulus_2  = Tristimulus.new(tristimulus['x2'],  tristimulus['y2'],  tristimulus['z2'])
          @tristimulus_10 = Tristimulus.new(tristimulus['x10'], tristimulus['y10'], tristimulus['z10'])
        end
      end
      alias :observer_2 :reference_2
      alias :observer_10 :reference_10
      
    end
    
    Whitepoints = {}
    YAML.load(File.read('lib/rainbow/data/whitepoint.yml'))['color']['whitepoint'].each do |name, whitepoint|
      Whitepoints[name] = Whitepoint.new(name, whitepoint)
    end
  end
end