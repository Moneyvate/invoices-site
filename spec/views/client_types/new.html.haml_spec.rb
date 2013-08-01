require 'spec_helper'

describe "client_types/new" do
  before(:each) do
    assign(:client_type, stub_model(ClientType,
      :name => "MyString"
    ).as_new_record)
  end

  it "renders new client_type form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", client_types_path, "post" do
      assert_select "input#client_type_name[name=?]", "client_type[name]"
    end
  end
end
