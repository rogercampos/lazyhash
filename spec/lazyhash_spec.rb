require 'spec_helper'

describe LazyHash do
  before do
    @hash = LazyHash.build_hash
  end

  describe ".add" do
    it "should assign consecutive values with different deep's" do
      LazyHash.add(@hash, "es.projects.title", "Main title")
      LazyHash.add(@hash, "es.ph1", "one paragraph")

      @hash.should == {"es" => {"projects" => {"title" => "Main title"}, "ph1" => "one paragraph"}}
    end

    it "should overwrite values for the same key" do
      LazyHash.add(@hash, "es.ph1", "First value")
      LazyHash.add(@hash, "es.ph1", "Second value")

      @hash.should == {"es" => {"ph1" => "Second value"}}
    end

    it "should not overwrite a node previously defined as a 'folder'" do
      LazyHash.add(@hash, "es.projects.title", "Main title")
      LazyHash.add(@hash, "es.projects", "try to convert the projects folder into a value with this string")

      @hash.should == {"es" => {"projects" => {"title" => "Main title"}}}
    end

    it "should not overwrite a node previously defined as a 'value'" do
      LazyHash.add(@hash, "es.projects", "title")
      LazyHash.add(@hash, "es.projects.title", "Main title")

      puts @hash.inspect
      @hash.should == {"es" => {"projects" => "title"}}
    end
  end

  describe ".add!" do
    it "should assign consecutive values with different deep's"
    it "should raise an error when overwriting a folder"
    it "should raise an error when overwriting a file"
  end

  describe ".no_lazy" do
    it "should return a copy of the given Hash without the proc constructor"
  end
end
