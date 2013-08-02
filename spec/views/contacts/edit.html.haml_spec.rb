require 'spec_helper'

describe "contacts/edit" do
  before(:each) do
    @contact = assign(:contact, stub_model(Contact,
      :contact_type => nil,
      :name => "MyString",
      :title => "MyString",
      :email => "MyString",
      :phone => 1,
      :skype => "MyString",
      :im => "MyString"
    ))
  end

  it "renders the edit contact form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", contact_path(@contact), "post" do
      assert_select "input#contact_contact_type[name=?]", "contact[contact_type]"
      assert_select "input#contact_name[name=?]", "contact[name]"
      assert_select "input#contact_title[name=?]", "contact[title]"
      assert_select "input#contact_email[name=?]", "contact[email]"
      assert_select "input#contact_phone[name=?]", "contact[phone]"
      assert_select "input#contact_skype[name=?]", "contact[skype]"
      assert_select "input#contact_im[name=?]", "contact[im]"
    end
  end
end
