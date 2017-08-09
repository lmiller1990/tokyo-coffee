require "test_helper"

describe Facility do
  let(:facility) { Facility.new }

  it "must be valid" do
    value(facility).must_be :valid?
  end
end
