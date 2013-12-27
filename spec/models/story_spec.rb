require 'spec_helper'

describe Story do

  it "should have story name" do
    build(:story_1, story_name: '').should_not be_valid
  end

  it "should be unique" do
    create(:story_1)
    build(:story_2, story_name: 'test story 1').should_not be_valid
  end

  it "should have contact email" do
    build(:story_1, contact_email: '').should_not be_valid
  end

  it "should have location" do
    build(:story_1, appear_location: '').should_not be_valid
  end

  it "should have info" do
    build(:story_1, info_from: '').should_not be_valid
  end

  it "should have details" do
    build(:story_1, story_details: '').should_not be_valid
  end
end
