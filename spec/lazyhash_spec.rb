require 'spec_helper'

describe LazyHash do
  before do
    @hash = LazyHash.build_hash
  end

  it "should assign consecutive values with different deep's" do
    LazyHash.add(@hash, "es.projects.title", "Main title")
    LazyHash.add(@hash, "es.ph1", "one paragraph")

    @hash.should == {"es" => {"projects" => {"title" => "Main title"}, "ph1" => "one paragraph"}}
  end

  it "should not overwrite existing values with keys" do
    LazyHash.add(@hash, "es.projects.title", "Main title")
    LazyHash.add(@hash, "es.projects", "title")

    @hash.should == {"es" => {"projects" => {"title" => "Main title"}}}
  end
end
