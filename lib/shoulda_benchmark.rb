module ShouldaAddons
  module MiniTest
    module Benchmark
      def self.included(base)
        base.class_eval do
          alias :run_before_benchmark :run
          
          def run args = []
            result = run_before_benchmark
            puts Shoulda.runtimes.collect{|name, total| [name, total]}.
              sort{|runtime1, runtime2| runtime2[1] <=> runtime1[1]}[0...10].
              collect{|name, total| "#{"%0.2f" % total} s: #{name.to_s.gsub(/test: /, "")}"}.<<("").join("\n")
            result
          end
        end
      end
    end
  end
end

if defined?(MiniTest::Unit)
  module ::MiniTest
    class Unit
      include ShouldaAddons::MiniTest::Benchmark
    end
  end
else
  require 'test/unit/testresult'
  module Test
    module Unit
      class TestResult
        alias :to_old_s :to_s
        def to_s
          Shoulda.runtimes.collect{|name, total| [name, total]}.
            sort{|runtime1, runtime2| runtime2[1] <=> runtime1[1]}[0...10].
            collect{|name, total| "#{"%0.2f" % total} s: #{name.to_s.gsub(/test: /, "")}"}.<<("").<<(to_old_s).join("\n")
        end
      end
    end
  end
end

require 'test/unit/testcase'
module Test
  module Unit
    class TestCase
      def self.method_added(name)
        return if @ignoring_added_methods
        
        @__instrumented_methods ||= {}
        return unless name.to_s.match(/^test:/) || @__instrumented_methods[name]
        @ignoring_added_methods = true
        alias_method " #{name}", "#{name}"
        @__instrumented_methods[name] = true
        define_method(name) do
          runtime = Benchmark.realtime do
            send(" #{name}")
          end
          Shoulda.runtimes[self.name] = runtime
        end
        @ignoring_added_methods = false
      end
    end
  end
end

module Shoulda  
  def self.runtimes
    @runtimes ||= {}
  end
end
