require 'spec_helper'

describe "client_types/edit" do
  before(:each) do
    @client_type = assign(:client_type, stub_model(ClientType,
      :name => "MyString"
    ))
  end

  it "renders the edit client_type form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", client_type_path(@client_type), "post" do
      assert_select "input#client_type_name[name=?]", "client_type[name]"
    end
  end
end
