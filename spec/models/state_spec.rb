require 'spec_helper'

describe Story do

  before :each do
    @story_1 = build(:story_1)
    @story_2 = build(:story_2)
    @story_2.published!
    @story_3 = build(:story_3)
    @story_3.rejected!
  end

  describe 'state' do
    describe 'pending' do
      it 'should be an initial state' do
        @story_1.should be_pending
      end

      it 'should be able to transfer to published at any state' do
        @story_1.published!
        @story_1.should be_published
        @story_2.published!
        @story_2.should be_published
        @story_3.published!
        @story_3.should be_published
      end

      it 'should be able to transfer to rejected while pending and published' do
        @story_1.rejected!
        @story_1.should be_rejected
        @story_2.rejected!
        @story_2.should be_rejected
      end

      it 'should be able to transfer to pending while published and rejected' do
        @story_2.pending!
        @story_2.should be_pending
        @story_3.pending!
        @story_3.should be_pending
      end
    end
  end
end