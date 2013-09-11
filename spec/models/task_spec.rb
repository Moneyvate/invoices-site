require 'spec_helper'

describe "An instance of", Task do
  let(:task) { FactoryGirl.build(:task) }
    
  it "should have a name" do
    expect(task.to_s).to eq(task.name)
  end
end
