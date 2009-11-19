puts 'Running test for Test::Unit 1.x'

require 'test/unit'
require 'rubygems'
require 'shoulda'
require File.dirname(__FILE__) + '/../lib/shoulda_benchmark'

class ShouldaBenchmarkTestUnit1xTest < Test::Unit::TestCase
  context 'Vrooom, vroom' do
    should 'be slow' do
      sleep 0.2
    end
    
    should 'be faster' do
      sleep 0.1
    end
    
    should 'be wicked fast' do
      # first!
    end
  end
end