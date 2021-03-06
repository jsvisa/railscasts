require 'spec_helper'

describe Episode do
  it "validates presence of name" do
    build(:episode, name: "").should have(1).errors_on(:name)
  end

  it "validates presence of description" do
    build(:episode, description: "").should have(1).errors_on(:description)
  end

  it "translates single digit seconds into timecode with minutes" do
    create(:episode, seconds: 60*8+3).timecode.should eq('8:03')
  end

  it "translates double digit seconds into timecode with minutes" do
    create(:episode, seconds: 60*8+12).timecode.should eq('8:12')
  end

  it "returns nil for timecode if seconds aren't set" do
    create(:episode, seconds: nil).timecode.should be_nil
  end

  it "parses timecode into seconds" do
    create(:episode, timecode: '10:03').seconds.should eq(603)
    create(:episode, timecode: '').seconds.should be_nil
  end
end
