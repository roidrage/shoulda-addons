puts 'Running test for Test::Unit 2.x'

require 'rubygems'
gem 'test-unit'
require 'shoulda'
require File.dirname(__FILE__) + '/../lib/shoulda_benchmark'

class ShouldaBenchmarkTestUnit2xTest < Test::Unit::TestCase
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