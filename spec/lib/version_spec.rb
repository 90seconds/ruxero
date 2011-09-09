require 'spec_helper'

describe "Ruxero::VERSION" do

  it "should return a version string" do
    Ruxero::VERSION.should_not be_nil
  end

end
