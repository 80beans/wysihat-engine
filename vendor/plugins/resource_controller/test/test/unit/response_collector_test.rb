require File.dirname(__FILE__)+'/../test_helper'

class ResponseCollectorTest < ActiveSupport::TestCase
  context "yielding a block to a collector object" do
    setup do
      @collector = ResourceController::ResponseCollector.new
      block = lambda do |wants|
        wants.html {}
        wants.js {}
        wants.xml
      end
      block.call(@collector)
    end

    should "collect responses" do
      assert_equal Proc, @collector[:html][1].class, @collector[:html].inspect
      assert_equal Proc, @collector[:js][1].class, @collector[:js].inspect
      assert @collector[:xml][1].nil?, @collector[:xml].inspect
    end
    
    should "clear responses with clear method" do
      @collector.clear
      assert @collector.responses.empty?
    end
    
    should "destroy methods before readding them, if they're already there" do
      @collector.html
      assert @collector[:html][1].nil?
    end
  end
  
  context "duplicating a response collector" do
    setup do
      @collector = ResourceController::ResponseCollector.new
      @collector.js
      @duplicate = @collector.dup
      @collector.css
    end

    should "not bleed in to the original" do
      assert @duplicate[:css].nil?
    end
    
    should "duplicate existing responses at the time of duplication" do
      assert_equal :js, @duplicate[:js].first
    end
  end
  
end