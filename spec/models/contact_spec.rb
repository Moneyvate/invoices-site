require 'spec_helper'

describe "An instance of", Contact do
  let(:contact) { FactoryGirl.create(:contact) }

  it "should have a name" do
    expect(contact.to_s).to eq(contact.name)
  end

  context "when a phone number is given" do
    context "and the phone number has 10 digits" do
      it "displays a properly formatted 10-digit phone number" do
        contact.phone = 8885551234
        expect(contact.formatted_phone).to eq("(888) 555-1234")
      end
    end

    context "and the phone number has 7 digits" do
      it "displays a properly formatted 7-digit phone number" do
        contact.phone = 5551234
        expect(contact.formatted_phone).to eq("555-1234")
      end
    end
  end

  context "when a phone number is not given" do
    it "should be 'None'" do
      expect(contact.formatted_phone).to eq("None")
    end
  end
end
