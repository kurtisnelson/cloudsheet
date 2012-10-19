module Cloudsheet
  class Row
    def initialize
    end

    def parse(data, map = nil)
      @map = map
      @data = data.to_a
      if @map
        @data = { }
        data.each_with_index do |d, i|
          @data[@map[i].name] = @map.parse(i, d)
        end
      end
      self
    end

    def [](key)
      @data[key]
    end
  end
end
