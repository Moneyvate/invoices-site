require 'spec_helper'

describe "An instance of", User do
  let(:user) { FactoryGirl.build(:user) }

  it "should have a name" do
    expect(user.to_s).to eq(user.username)
  end
end
