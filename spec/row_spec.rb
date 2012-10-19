require 'spec_helper'

describe Cloudsheet::Row do
  let(:example) {["0", "hi", Date.today.to_s]}
  context "no map" do
    subject{Cloudsheet::Row.parse(example)}
    
    it "constructs" do
      subject[0].should eq(example[0])
      subject[1].should eq(example[1])
      subject[2].should eq(example[2])
    end

    specify{subject.count.should eq(example.count)} 
  end

  context "map" do
    let(:map) { 
      map = double("map")
      map.stub_chain(:[], :name){"name"}
      map.stub(:read){"data"}
      map
    }

    subject{Cloudsheet::Row.parse([0], map)}
    it "constructs" do
      subject["name"].should eq("data")
    end

    specify{subject.count.should eq(1)}
  end
end
