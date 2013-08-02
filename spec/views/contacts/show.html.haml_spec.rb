require 'spec_helper'

describe "contacts/show" do
  before(:each) do
    @contact = assign(:contact, stub_model(Contact,
      :contact_type => nil,
      :name => "Name",
      :title => "Title",
      :email => "Email",
      :phone => 1,
      :skype => "Skype",
      :im => "Im"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    rendered.should match(/Name/)
    rendered.should match(/Title/)
    rendered.should match(/Email/)
    rendered.should match(/1/)
    rendered.should match(/Skype/)
    rendered.should match(/Im/)
  end
end
