module Cloudsheet
  class Row < Hash
    def initialize(map)
      @map = map
    end

    def self.parse(data, map = nil)
      map = Cloudsheet::Map.new unless map  
      row = self.new(map)
      data.each_with_index do |d, i|
        row[map[i].name] = map.read(i, d)
      end
      row
    end
  end
end
