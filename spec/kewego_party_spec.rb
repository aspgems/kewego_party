# -*- encoding: utf-8 -*-
require 'spec_helper'

describe KewegoParty do
  describe ".respond_to?" do
    it "should be true if method exists" do
      KewegoParty.respond_to?(:new, true).should be_true
    end
  end

  describe ".new" do
    it "should be a KewegoParty::Client" do
      KewegoParty.new.should be_a KewegoParty::Client
    end
  end

  describe ".delegate" do
    pending "should delegate missing methods to Kewego::Client" do

    end
  end
end