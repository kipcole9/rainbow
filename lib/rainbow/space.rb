module Rainbow
  module Color
    class Space
      attr_reader :name, :space
      
      def initialize(name, space)
        @name = name
        @space = space
      end
      
      def whitepoint
        Rainbow::Color::Whitepoints[space['whitepoint'].to_s]
      end
      
      def gamma
        space['gamma']
      end
      
    end
    
    Spaces = {}
    YAML.load(File.read('lib/rainbow/yaml/rgb_color_space.yml'))['color']['space'].each do |name, space|
      Spaces[name] = Space.new(name, space)
    end
  end
end