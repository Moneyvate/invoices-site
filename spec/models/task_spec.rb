require 'spec_helper'

describe "An instance of", Task do
  let(:task) { FactoryGirl.build(:task) }
    
  it "should have a name" do
    expect(task.to_s).to eq(task.name)
  end

  describe ".complexity" do
    context "user selects 'Not Estimated'" do
      it "should not be estimated" do
        expect(task).not_to be_estimated
      end

      it "should return 0" do
        expect(task.complexity).to eq(0)
      end
    end
  end
end
