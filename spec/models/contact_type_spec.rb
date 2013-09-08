require 'spec_helper'

describe "An instance of", ContactType do
  let(:contact_type) { FactoryGirl.build(:contact_type) }

  it "should have a name" do
    expect(contact_type.to_s).to eq(contact_type.name)
  end
end
