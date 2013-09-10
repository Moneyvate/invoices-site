require 'spec_helper'

describe "work_logs/show" do
  before(:each) do
    @work_log = assign(:work_log, stub_model(WorkLog,
      :task => nil,
      :hours => "9.99"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    rendered.should match(/9.99/)
  end
end
