require 'spec_helper'

describe "work_logs/new" do
  before(:each) do
    assign(:work_log, stub_model(WorkLog,
      :task => nil,
      :hours => "9.99"
    ).as_new_record)
  end

  it "renders new work_log form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", work_logs_path, "post" do
      assert_select "input#work_log_task[name=?]", "work_log[task]"
      assert_select "input#work_log_hours[name=?]", "work_log[hours]"
    end
  end
end
