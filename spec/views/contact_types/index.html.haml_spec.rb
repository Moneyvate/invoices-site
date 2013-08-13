require 'spec_helper'

describe "contact_types/index" do
  before(:each) do
    assign(:contact_types, [
      stub_model(ContactType,
        :name => "Name"
      ),
      stub_model(ContactType,
        :name => "Name"
      )
    ])
  end

  it "renders a list of contact_types" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
