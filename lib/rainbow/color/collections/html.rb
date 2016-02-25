module Rainbow
  module Color
    module Collections
      HTML    = {}.tap {|collection| html {|code, color, names| collection[code] = {color: color, names: names}}}
    end
  end
end