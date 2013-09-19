require 'spec_helper'
require 'hours_calculator'

describe HoursCalculator do
  let(:one_hour) { FactoryGirl.create(:one_hour) }
  let(:hc) { HoursCalculator.new(one_hour) }

  context "when summing all hours" do
    context "and the total work log hours is 1" do
      it "should output 1" do
        expect(hc.calculate).to eq(1)
      end
    end
  end
end
