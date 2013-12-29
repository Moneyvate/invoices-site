require 'spec_helper'
require 'hours_calculator'

describe HoursCalculator do
  
  context "when summing all hours" do
    context "and the total work hours is 15 minutes" do
      it "should output 0.25" do
        time = FactoryGirl.build(:work_log, end_time: 15.minutes.from_now)
        input = HoursCalculator.new(time)
        expect(input.calculate).to eq(0.25)
      end
    end

    context "and the total work hours is 30 minutes" do
      it "should output 0.5" do
        time = FactoryGirl.build(:work_log, end_time: 30.minutes.from_now)
        input = HoursCalculator.new(time)
        expect(input.calculate).to eq(0.5)
      end
    end

    context "and the total work log hours is 1" do
      it "should output 1" do
        time = FactoryGirl.build(:work_log, end_time: 1.hour.from_now)
        input = HoursCalculator.new(time)
        expect(input.calculate).to eq(1)
      end
    end

    context "and the total work log time is 1 hour, 15 minutes" do
      it "should output 1.25" do
        time = FactoryGirl.build(:work_log, end_time: 1.hour.from_now + 15.minutes)
        input = HoursCalculator.new(time)
        expect(input.calculate).to eq(1.25)
      end
    end

    context "and the total work log time is 1 hour, 30 minutes" do
      it "should output 1.50" do
        time = FactoryGirl.build(:work_log, end_time: 1.hour.from_now + 30.minutes)
        input = HoursCalculator.new(time)
        expect(input.calculate).to eq(1.50)
      end
    end

    context "and the total work log time is 1 hour, 45 minutes" do
      it "should output 1.75" do
        time = FactoryGirl.build(:work_log, end_time: 1.hour.from_now + 45.minutes)
        input = HoursCalculator.new(time)
        expect(input.calculate).to eq(1.75)
      end
    end
  end
end
