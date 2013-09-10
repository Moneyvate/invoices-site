require 'spec_helper'

describe "work_logs/index" do
  before(:each) do
    assign(:work_logs, [
      stub_model(WorkLog,
        :task => nil,
        :hours => "9.99"
      ),
      stub_model(WorkLog,
        :task => nil,
        :hours => "9.99"
      )
    ])
  end

  it "renders a list of work_logs" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
  end
end
