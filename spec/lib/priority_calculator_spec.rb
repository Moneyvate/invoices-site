require 'spec_helper'
require 'priority_calculator'

describe PriorityCalculator do

  let(:task) { FactoryGirl.create(:task) }

  context "when calculating a task's priority" do
    
    context "and the task does not have a due date" do
      it "should be 0" do
        p = PriorityCalculator.new(task)
        expect(p.calculate).to eq(0 + p.status)
      end
    end

    context "and the due date is in the past" do
      it "should be 50" do
        past = FactoryGirl.build(:task, :not_started, :not_estimated, due_date: 1.day.ago)
        p = PriorityCalculator.new(past)
        expect(p.calculate).to eq(50 + p.status)
      end
    end

    context "and the due date is <= 1 week from now" do
      it "should be 25" do
        future = FactoryGirl.build(:task, :not_started, :not_estimated, due_date: 1.week.from_now)
        p = PriorityCalculator.new(future)
        expect(p.calculate).to eq(25 + p.status)
      end
    end

    context "and the due date is between 1 week from now and 1 month from now" do
      it "should be 12" do
        future = FactoryGirl.build(:task, :not_started, :not_estimated, due_date: 1.month.from_now)
        p = PriorityCalculator.new(future)
        expect(p.calculate).to eq(12 + p.status)
      end
    end

    context "and the due date is between 1 month and 3 months from now" do
      it "should be 9" do
        future = FactoryGirl.build(:task, :not_started, :not_estimated, due_date: 3.months.from_now)
        p = PriorityCalculator.new(future)
        expect(p.calculate).to eq(9 + p.status)
      end
    end

    context "and the due date is between 3 months and 6 months from now" do
      it "should be 6" do
        future = FactoryGirl.build(:task, :not_started, :not_estimated, due_date: 6.months.from_now)
        p = PriorityCalculator.new(future)
        expect(p.calculate).to eq(6 + p.status)
      end
    end

    context "and the due date is between 6 months and 9 months from now" do
      it "should be 3" do
        future = FactoryGirl.build(:task, :not_started, :not_estimated, due_date: 9.months.from_now)
        p = PriorityCalculator.new(future)
        expect(p.calculate).to eq(3 + p.status)
      end
    end

    context "and the due date is between 9 months and 10 months from now" do
      it "should be 2" do
        future = FactoryGirl.build(:task, :not_started, :not_estimated, due_date: 10.months.from_now)
        p = PriorityCalculator.new(future)
        expect(p.calculate).to eq(2 + p.status)
      end
    end

    context "and the due date is between 10 months and 1 year from now" do
      it "should be 1" do
        future = FactoryGirl.build(:task, :not_started, :not_estimated, due_date: 1.year.from_now)
        p = PriorityCalculator.new(future)
        expect(p.calculate).to eq(1 + p.status)
      end
    end

    context "and the due date is more than 1 year ago" do
      it "should be 0" do
        future = FactoryGirl.build(:task, :not_started, :not_estimated, due_date: 2.years.from_now)
        p = PriorityCalculator.new(future)
        expect(p.calculate).to eq(0 + p.status)
      end

      context "and the task status is 0" do
        it "should be 0" do
          #future = FactoryGirl.build(:task, due_date: 2.years.from_now, status: 0)
          future = FactoryGirl.build(:task, :finished, :not_estimated, due_date: 2.years.from_now)
          p = PriorityCalculator.new(future)
          expect(p.calculate).to eq(0)
        end
      end

      context "and the task status is 5" do
        it "should be 5" do
          future = FactoryGirl.build(:task, :not_started, :not_estimated, due_date: 2.years.from_now)
          p = PriorityCalculator.new(future)
          expect(p.calculate).to eq(5)
        end
      end
    end

  end

end
