require 'spec_helper'

describe "contact_types/edit" do
  before(:each) do
    @contact_type = assign(:contact_type, stub_model(ContactType,
      :name => "MyString"
    ))
  end

  it "renders the edit contact_type form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", contact_type_path(@contact_type), "post" do
      assert_select "input#contact_type_name[name=?]", "contact_type[name]"
    end
  end
end
