puts 'Running test for Test::Unit 2.x'

require 'rubygems'
gem 'test-unit'
require File.dirname(__FILE__) + '/../lib/shoulda_list_runner'
require 'shoulda'

class ShouldaBenchmarkTestUnit1xTest < Test::Unit::TestCase
  context 'I' do
    should 'be green' do
      assert true
    end
    
    should 'be red' do
      assert false
    end
  end
end