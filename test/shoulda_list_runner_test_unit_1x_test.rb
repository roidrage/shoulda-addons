puts 'Running test for Test::Unit 1.x'

require 'test/unit'
require 'rubygems'
require 'shoulda'
require File.dirname(__FILE__) + '/../lib/shoulda_list_runner'

class ShouldaBenchmarkTestUnit1xTest < Test::Unit::TestCase
  context 'Vrooom, vroom' do
    should 'be green' do
      assert true
    end
    
    should 'be red' do
      assert false
    end
  end
end