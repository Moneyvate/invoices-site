require 'spec_helper'
require 'hours_calculator'

describe "An instance of", Task do
    
  it "should have a name" do
    task = FactoryGirl.build(:task)
    expect(task.to_s).to eq(task.name)
  end

  describe ".complexity" do
    context "user selects 'Not Estimated'" do
      task = FactoryGirl.build(:task, :not_estimated, :not_started)

      it "should not be estimated" do
        expect(task).not_to be_estimated
      end

      it "should return 0" do
        expect(task.complexity).to eq(0)
      end
    end

    context "user selects 'Easy'" do
      easy = FactoryGirl.build(:task, :easy, :not_started)

      it "should be estimated" do
        expect(easy).to be_estimated
      end

      it "should be easy" do
        expect(easy).to be_easy
      end

      it "should return 1" do
        expect(easy.complexity).to eq(1)
      end
    end

    context "user selects 'Medium'" do
      medium = FactoryGirl.build(:task, :medium, :not_started)

      it "should be estimated" do
        expect(medium).to be_estimated
      end

      it "should not be easy" do
        expect(medium).not_to be_easy
      end

      it "should be medium" do
        expect(medium).to be_medium
      end

      it "should return 3" do
        expect(medium.complexity).to eq(3)
      end
    end

    context "user selects 'Hard'" do
      hard = FactoryGirl.build(:task, :hard, :not_started)

      it "should be estimated" do
        expect(hard).to be_estimated
      end

      it "should not be easy" do
        expect(hard).not_to be_easy
      end

      it "should not be medium" do
        expect(hard).not_to be_medium
      end

      it "should be hard" do
        expect(hard).to be_hard
      end

      it "should return 5" do
        expect(hard.complexity).to eq(5)
      end
    end
  end

  describe ".status" do
    context "user selects 'Not Started'" do
      task = FactoryGirl.build(:task, :not_started)

      it "should not be started" do
        expect(task).not_to be_started
      end

      it "should not be finished" do
        expect(task).not_to be_finished
      end

      it "should return 5" do
        expect(task.status).to eq(5)
      end
    end

    context "user selects 'In Progress'" do
      in_progress = FactoryGirl.build(:task, :in_progress)

      it "should be started" do
        expect(in_progress).to be_started
      end

      it "should not be finished" do
        expect(in_progress).not_to be_finished
      end

      it "should return 3" do
        expect(in_progress.status).to eq(3)
      end
    end

    context "user selects 'Finished'" do
      finished = FactoryGirl.build(:task, :finished)

      it "should be finished" do
        expect(finished).to be_finished
      end

      it "should return 0" do
        expect(finished.status).to eq(0)
      end
    end
  end

  describe ".total_hours" do
    context "task has no work logs" do
      task = FactoryGirl.build(:task, :not_estimated, :not_started)

      it "should output 0" do
        expect(task.total_hours).to eq(0)
      end
    end

    context "task work logs add up to 12 and a half hours" do
      six_hours = FactoryGirl.build(:work_log, end_time: 6.hours.from_now)

      it "should output 12.5" do
        current_task = Task.new

        current_task.work_logs << six_hours
        current_task.work_logs << six_hours
        current_task.work_logs << FactoryGirl.build(:work_log, end_time: 30.minutes.from_now)

        current_task.save

        current_task.work_logs.each do |wl|
          hc = HoursCalculator.new(wl)
          wl.hours = hc.calculate
          wl.save
        end

        expect(current_task.total_hours).to eq(12.5.to_d)
      end
    end

  end
end
