require 'spec_helper'

describe LazyHash do
  before do
    @hash = LazyHash.build_hash
  end

  it "should not be marshable" do
    lambda { Marshal.dump(@hash) }.should raise_error
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
      LazyHash.add(@hash, "es.projects", "Proyectos")
      LazyHash.add(@hash, "es.projects.title", "try to convert a value into a folder with other values")

      @hash.should == {"es" => {"projects" => "Proyectos"}}
    end
  end

  describe ".no_lazy" do
    it "should return a copy of the given hash" do
      LazyHash.add(@hash, "es.projects", "Proyectos")
      unlazy = LazyHash.no_lazy(@hash)
      unlazy.should == {"es" => {"projects" => "Proyectos"}}
    end

    it "should return a copy of the given hash without the proc constructor" do
      unlazy = LazyHash.no_lazy(@hash)
      unlazy.default_proc.should be_nil
    end

    it "should return a marshable hash" do
      unlazy = LazyHash.no_lazy(@hash)
      lambda { Marshal.dump(unlazy) }.should_not raise_error
    end
  end
end
