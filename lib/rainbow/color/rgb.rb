module Rainbow
  module Color
    class RGB
      attr_reader :r, :g, :b, :space
      
      def initialize(r, g, b, options = {})
        @r, @g, @b  = normalize_range(r, g, b)
        @space      = Rainbow::Color::Spaces[options[:space].to_s]
        @linearized = options[:linearized]
      end
      
      def whitepoint
        @whitepoint ||= space.whitepoint
      end
      
      def gamma
        @gamma ||= space.gamma
      end
      
      def gamma_expand
        if @linearized
          self
        else
          self.class.new(expand_channel(r), expand_channel(g), expand_channel(b), 
            space: space.name, linearized: true)
        end
      end
      alias :linearize :gamma_expand
      alias :expand :gamma_expand
      
      def gamma_compress
        unless @linearized
          self
        else
          self.class.new(compress_channel(r), compress_channel(g), compress_channel(b), 
            space: space.name, linearized: false)
        end     
      end
      alias :gamma_correct :gamma_compress
      alias :compress :gamma_compress
        
    private
    
      def expand_channel(c)
        c ** gamma
      end

      def compress_channel(c)
        c ** (1 / gamma)
      end  
      
      def normalize_range(r, g, b)
        if [r, g, b].max > 1
          return r / 255.0, g / 255.0, b / 255.0
        else
          return r, g, b
        end
      end 
    end
  end
end