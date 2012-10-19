require 'spec_helper'

describe Cloudsheet::Mapping do
  subject { Cloudsheet::Mapping.new(:test) }
  describe "#type" do
    specify{ expect{subject.type(Object)}.to raise_error}
    it "defaults to no-op" do
      subject.read.call(nil).should be_nil
      obj = Object.new
      subject.read.call(obj).should be obj
    end

    it "supports String" do
      subject.type(String)
      subject.read.call("Hello").should eq(String.new("Hello"))
      subject.read.call("").should eq("")
    end

    it "supports Date" do
      subject.type(Date)
      subject.read.call(Date.today.to_s).should eq(Date.today)
      subject.read.call("").should be_nil
    end

    it "supports DateTime" do
      subject.type(DateTime)
      now = DateTime.now
      subject.read.call(now.to_s).should eq(DateTime.parse(now.to_s))
    end

    it "supports Integer" do
      subject.type(Integer)
      num = Random.rand(0...100)
      subject.read.call(num.to_s).should eq(num)
    end

    it "supports Float" do
      subject.type(Float)
      subject.read.call("100.5").should eq(100.5)
    end

    it "supports money" do
      subject.type("money")
      subject.read.call("$100,981.02").should eq(100981.02)
    end

    it "supports month" do
      subject.type("month")
      subject.read.call("12/2012").should be_an_instance_of Date
    end
  end
end
