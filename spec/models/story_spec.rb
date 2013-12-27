require 'spec_helper'

describe Story do
  it "should have story name" do
    build(:stories, story_name: "").should_not_be_valid
  end
end
