module Cloudsheet
  class Mapping
    attr_reader :name, :read
    TO_S = ->(d) {d.to_s}
    NOOP = ->(d) {d}
    def initialize(name)
      @name = name
      @read = NOOP
      @write = NOOP
    end
    
    def map(read, write = nil)
      @read = read
      @write = write if write
      self
    end

    def type(klass)
      klass = klass.to_s if klass.is_a? Class
      klass.downcase!
      case klass #Because case uses ===
      when "string"
        @read = ->(d) {String.new(d) if d}
        @write = TO_S
      when "date"
        @read = ->(d) {Date.parse(d) if not d.empty?}
        @write = TO_S
      when "float"
        @read = ->(d) {d.to_f if not d.empty?}
        @write = TO_S
      when "integer"
        @read = ->(d) {d.to_i if not d.empty?}
        @write = TO_S
      when "datetime"
        @read = ->(d) {DateTime.parse(d) if not d.empty?}
        @write = TO_S
      when "money"
        @read = ->(d) {d.gsub(',','').gsub('$','').to_f}
        @write = ->(d) {"$"+d.to_s}
      when "month"
        @read = ->(d) {Date.strptime(d, '%m/%Y') if not d.empty?}
        @write = ->(d) {d.strftime("%m/%Y")}
      else
        raise "No mapping for that type is built in"
      end
    end
  end
end
