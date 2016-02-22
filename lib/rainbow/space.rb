module Rainbow
  module Color
    class Space
      attr_reader :name, :whitepoint, :gamma, :to_xyz_matrix, :from_xyz_matrix, 
                  :red_reference, :green_reference, :blue_reference
      
      def initialize(name, space)
        @name              = name
        @gamma             = space['gamma']
        @whitepoint        = Rainbow::Color::Whitepoints[space['whitepoint'].to_s]
        @red_reference     = Chromaticity.new(space['xR'], space['yR'])
        @green_reference   = Chromaticity.new(space['xG'], space['yG'])
        @blue_reference    = Chromaticity.new(space['xB'], space['yB'])
        @from_xyz_matrix   = space['from_xyz']
        @to_xyz_matrix     = space['to_xyz']      
      end
    end
    
    Spaces = {}
    YAML.load(File.read('lib/rainbow/yaml/color_space.yml'))['color']['space'].each do |name, space|
      Spaces[name] = Space.new(name, space)
    end
  end
end