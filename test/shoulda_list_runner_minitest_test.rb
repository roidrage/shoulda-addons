unless RUBY_VERSION >= '1.9'
  puts 'Meant to run on Ruby 1.9'
  exit
end

puts 'Running test for Minitest'

require 'test/unit'
require 'rubygems'
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