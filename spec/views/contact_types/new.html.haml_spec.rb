require 'spec_helper'

describe "contact_types/new" do
  before(:each) do
    assign(:contact_type, stub_model(ContactType,
      :name => "MyString"
    ).as_new_record)
  end

  it "renders new contact_type form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", contact_types_path, "post" do
      assert_select "input#contact_type_name[name=?]", "contact_type[name]"
    end
  end
end
