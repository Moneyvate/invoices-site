require 'spec_helper'

describe "contact_types/show" do
  before(:each) do
    @contact_type = assign(:contact_type, stub_model(ContactType,
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
  end
end
