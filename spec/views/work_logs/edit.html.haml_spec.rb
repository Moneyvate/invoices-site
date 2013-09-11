require 'spec_helper'

describe "work_logs/edit" do
  before(:each) do
    @work_log = assign(:work_log, stub_model(WorkLog,
      :task => nil,
      :hours => "9.99"
    ))
  end

  it "renders the edit work_log form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", work_log_path(@work_log), "post" do
      assert_select "input#work_log_task[name=?]", "work_log[task]"
      assert_select "input#work_log_hours[name=?]", "work_log[hours]"
    end
  end
end
