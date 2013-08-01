require 'spec_helper'

describe "client_types/index" do
  before(:each) do
    assign(:client_types, [
      stub_model(ClientType,
        :name => "Name"
      ),
      stub_model(ClientType,
        :name => "Name"
      )
    ])
  end

  it "renders a list of client_types" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
