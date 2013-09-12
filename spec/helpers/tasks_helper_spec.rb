require 'spec_helper'

# Specs in this file have access to a helper object that includes
# the TasksHelper. For example:
#
# describe TasksHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
describe TasksHelper do
  let(:task) { FactoryGirl.build(:task) }
  let(:easy) { FactoryGirl.build(:easy) }
  let(:medium) { FactoryGirl.build(:medium) }
  let(:hard) { FactoryGirl.build(:hard) }

  describe "when displaying a due date to the user" do
    context "and there is no due date selected" do
      it "should display 'None'" do
        expect(helper.task_due(nil)).to eq("None")
      end
    end

    context "and the selected due date is today" do
      it "should display 'Today'" do
        expect(helper.task_due(Date.today)).to eq("Today")
      end
    end

    context "and the selected due date is tomorrow" do
      it "should display 'Tomorrow'" do
      	expect(helper.task_due(Date.tomorrow)).to eq("Tomorrow")
      end
    end

    context "and the selected due date is yesterday" do
      it "should display 'Yesterday'" do
        expect(helper.task_due(Date.yesterday)).to eq("Yesterday")
      end
    end

    context "and the selected due date is in the past" do
      it "should display '2 days ago'" do
        expect(helper.task_due(Date.yesterday - 1)).to eq("2 days ago")
      end
    end

    context "and the selected due date is in the future" do
      it "should display 'In 3 days'" do
        expect(helper.task_due(Date.today + 3)).to eq("In 3 days")
      end
    end
  end

  describe "a text formatter" do
    it "replaces carriage returns and line feeds with <br> tags" do
      unformatted_string = "One line.\r\nNext line."
      formatted_string = "One line.<br />Next line."
      expect(helper.format(unformatted_string)).to eq(formatted_string)
    end
  end

  describe ".human_complexity" do
    context "user has selected 'Not Estimated'" do
      it "should display 'Not Estimated'" do
        expect(helper.human_complexity(task)).to eq('Not Estimated')
      end
    end

    context "user has selected 'Easy'" do
      it "should display 'Easy'" do
        expect(helper.human_complexity(easy)).to eq('Easy')
      end
    end

    context "user has selected 'Medium'" do
      it "should display 'Medium'" do
        expect(helper.human_complexity(medium)).to eq('Medium')
      end
    end

    context "user has selected 'Hard'" do
      it "should display 'Hard'" do
        expect(helper.human_complexity(hard)).to eq('Hard')
      end
    end
  end
end
