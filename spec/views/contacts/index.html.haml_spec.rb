require 'spec_helper'

describe "contacts/index" do
  before(:each) do
    assign(:contacts, [
      stub_model(Contact,
        :contact_type => nil,
        :name => "Name",
        :title => "Title",
        :email => "Email",
        :phone => 1,
        :skype => "Skype",
        :im => "Im"
      ),
      stub_model(Contact,
        :contact_type => nil,
        :name => "Name",
        :title => "Title",
        :email => "Email",
        :phone => 1,
        :skype => "Skype",
        :im => "Im"
      )
    ])
  end

  it "renders a list of contacts" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Skype".to_s, :count => 2
    assert_select "tr>td", :text => "Im".to_s, :count => 2
  end
end
