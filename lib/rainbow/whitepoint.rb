module Rainbow
  module Color
    class Whitepoint
      def initialize(name, whitepoint)
        @name = name
        @whitepoint = whitepoint
      end
    end
    
    Whitepoints = {}
    YAML.load(File.read('lib/rainbow/yaml/whitepoint.yml'))['color']['whitepoint'].each do |name, whitepoint|
      Whitepoints[name] = Whitepoint.new(name, whitepoint)
    end
  end
end