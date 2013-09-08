require 'spec_helper'

describe "An instance of", Client do
  let(:client) { FactoryGirl.create(:client) }

  it "should have a name" do
    expect(client.name).not_to be_nil
  end

  it "should have a client type" do
  	expect(client.client_type).not_to be_nil
  end
end
