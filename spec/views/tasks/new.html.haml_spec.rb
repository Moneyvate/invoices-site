require 'spec_helper'

describe "tasks/new" do
  before(:each) do
    assign(:task, stub_model(Task,
      :user => nil,
      :client => nil,
      :name => "MyString",
      :description => "MyText",
      :notes => "MyText",
      :priority => 1,
      :rate => "9.99"
    ).as_new_record)
  end

  it "renders new task form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", tasks_path, "post" do
      assert_select "input#task_user[name=?]", "task[user]"
      assert_select "input#task_client[name=?]", "task[client]"
      assert_select "input#task_name[name=?]", "task[name]"
      assert_select "textarea#task_description[name=?]", "task[description]"
      assert_select "textarea#task_notes[name=?]", "task[notes]"
      assert_select "input#task_priority[name=?]", "task[priority]"
      assert_select "input#task_rate[name=?]", "task[rate]"
    end
  end
end
