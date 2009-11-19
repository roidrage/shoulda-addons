unless RUBY_VERSION >= '1.9'
  puts 'Meant to run on Ruby 1.9'
  exit
end

puts 'Running test for Minitest on Ruby 1.9'

require 'rubygems'
require 'test/unit'
require 'shoulda'
require File.dirname(__FILE__) + '/../lib/shoulda_benchmark'

class ShouldaBenchmarkMinitestTest < Test::Unit::TestCase
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