module Rainbow
  module Color
    module Collections
      require 'nokogiri'
      autoload :HTML,     'rainbow/color/collections/html'
      autoload :PANTONE,  'rainbow/color/collections/pantone'
      autoload :AS2700,   'rainbow/color/collections/as2700'
      autoload :BS381,    'rainbow/color/collections/bs381'
      autoload :BS4800,   'rainbow/color/collections/bs4800'
      autoload :RAL,      'rainbow/color/collections/ral'
      autoload :NCS,      'rainbow/color/collections/ncs'
      autoload :FS595C,   'rainbow/color/collections/fs595c'
      
      def self.collection_names
        self.singleton_methods
      end
      
      def self.html
        colors = Nokogiri::HTML(File.open("lib/rainbow/data/collections/HTML_Color_Names.html"))
        colors.css('tr').each do |row|
          names = row.css('td')[0].css('a').text.gsub(/([a-z])([A-Z])/,'\1 \2').split(',').map(&:strip)
          code = names.first.downcase.delete(' ')
          hex  = row.css('td')[1].css('a').text.delete('#')
          yield code, SRGB.hex(hex), names
        end
      end
      
      def self.pantone
        colors = Nokogiri::HTML(File.open("lib/rainbow/data/collections/Pantone_C_colors.html"))
        colors.css('tr').each do |row|
          name = row.css('td')[0].text.sub(/ C$/,'')
          name = name.match(/^([0-9]+)$/) ? "PMS #{$1}" : name
          code = name
          hex  = row.css('td')[1].text
          yield code, SRGB.hex(hex), [name]
        end
      end
      
      def self.as2700
        colors = Nokogiri::HTML(File.open("lib/rainbow/data/collections/Australia.html"))
        colors.css('tr').each do |row|
          hex   = row.css('td')[0].text.delete('#')
          color = row.css('td')[2].text
          code  = color[0..2]
          name  = color[4..-1]
          yield code, SRGB.hex(hex), [name]
        end
      end 
      
      def self.bs381
        colors = Nokogiri::HTML(File.open("lib/rainbow/data/collections/British.html"))
        colors.css("#BS381").css('tr').each do |row|
          hex  = row.css('td')[0].text.delete('#')
          code = row.css('td')[2].text
          name = row.css('td')[3].text
          yield code, SRGB.hex(hex), name == '' ? [] : [name]
        end
      end 
      
      def self.bs4800
        colors = Nokogiri::HTML(File.open("lib/rainbow/data/collections/British.html"))
        colors.css("#BS4800").css('tr').each do |row|
          hex   = row.css('td')[0].text.delete('#')
          code  = row.css('td')[2].text
          names = row.css('td')[3].text.split(' / ').map(&:strip)
          yield code, SRGB.hex(hex), names
        end
      end 
      
      def self.ral
        colors = Nokogiri::HTML(File.open("lib/rainbow/data/collections/RAL.html"))
        colors.css("#RAL").css('tr').each do |row|
          code  = row.css('td')[0].text
          hex   = row.css('td')[1].text.delete('#')
          names = row.css('td')[3].text.split(',').map(&:strip)
          yield code, SRGB.hex(hex), names
        end
      end 
      
      def self.ncs
        colors = Nokogiri::HTML(File.open("lib/rainbow/data/collections/NCS.html"))
        colors.css("#NCS").css('tr').each do |row|
          code  = row.css('td')[0].text.strip
          hex   = row.css('td')[1].text.delete('#')
          name  = code
          yield code, SRGB.hex(hex), [name]
        end
      end
      
      def self.fs595c
        colors = Nokogiri::HTML(File.open("lib/rainbow/data/collections/USA.html"))
        colors.css("#FS595C").css('tr').each do |row|
          hex   = row.css('td')[0].text.delete('#')
          names = row.css('td')[1].text.split(',').map(&:strip)
          code  = row.css('td')[2].text.strip
          yield code, SRGB.hex(hex), names
        end
      end
    end
  end
end