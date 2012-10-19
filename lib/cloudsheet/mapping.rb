module Cloudsheet
  class Map
    def initialize
      @data = {}
    end

    def []=(i,val)
      @data[i] = val
    end

    def [](i)
      if @data[i]
        @data[i]
      else
        Mapping.new(i)
      end
    end

    def parse(i, d)
      return nil unless d
      self[i].function.call d
    end
  end
  
  class Mapping < Struct.new :name, :function
    def initialize(name, func = ->(d) {String.new(d)})
      self.name = name
      self.function = func
    end
  end
end