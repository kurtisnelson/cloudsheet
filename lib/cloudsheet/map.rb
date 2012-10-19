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

    def read(i, d)
      return nil unless d
      self[i].read.call d
    end

    def write(i, d)
      return "" unless d
      self[i].write.call d
    end
  end
end
