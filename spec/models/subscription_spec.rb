require 'spec_helper'

describe Subscription do
  describe "association" do
    it { should belong_to(:user) }
    it { should belong_to(:comic) }
  end
end
