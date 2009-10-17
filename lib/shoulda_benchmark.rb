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
          Shoulda.runtimes[name] = runtime
        end
        @ignoring_added_methods = false
      end
      
    end
    
    class TestResult
      alias :to_old_s :to_s
      def to_s
        puts Shoulda.runtimes.collect {|name, total| total}.inject(0) {|num, sum| num + sum}
        Shoulda.runtimes.collect{|name, total| [name, total]}.
          sort{|runtime1, runtime2| runtime2[1] <=> runtime1[1]}[0...10].
          collect{|name, total| "#{"%0.2f" % total} s: #{name.to_s.gsub(/test: /, "")}"}.<<("").<<(to_old_s).join("\n")
      end
    end
  end
end

module Shoulda  
  def self.runtimes
    @runtimes ||= {}
  end
end