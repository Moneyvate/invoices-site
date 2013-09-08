require 'spec_helper'

describe "tasks/index" do
  before(:each) do
    assign(:tasks, [
      stub_model(Task,
        :user => nil,
        :client => nil,
        :name => "Name",
        :description => "MyText",
        :notes => "MyText",
        :priority => 1,
        :rate => "9.99"
      ),
      stub_model(Task,
        :user => nil,
        :client => nil,
        :name => "Name",
        :description => "MyText",
        :notes => "MyText",
        :priority => 1,
        :rate => "9.99"
      )
    ])
  end

  it "renders a list of tasks" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
  end
end
