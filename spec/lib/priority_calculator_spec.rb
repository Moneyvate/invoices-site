require 'spec_helper'
require 'priority_calculator'

describe PriorityCalculator do

  let(:task) { FactoryGirl.create(:task) }

  context "when calculating a task's priority" do
    
    context "and the task does not have a due date" do
      it "should be 0" do
        p = PriorityCalculator.new(task)
        expect(p.calculate).to eq(0)
      end
    end

    context "and the due date is in the past" do
      it "should be 50" do
        past = FactoryGirl.build(:task, due_date: 1.day.ago)
        p = PriorityCalculator.new(past)
        expect(p.calculate).to eq(50)
      end
    end

    context "and the due date is <= 1 week from now" do
      it "should be 25" do
        future = FactoryGirl.build(:task, due_date: 1.week.from_now)
        p = PriorityCalculator.new(future)
        expect(p.calculate).to eq(25)
      end
    end

  end

end
