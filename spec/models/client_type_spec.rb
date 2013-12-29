require 'spec_helper'

describe ClientType do
  let(:type) { FactoryGirl.create(:client_type) }
  
  it "should have a name" do
    type.name.should_not be_nil
  end
end
