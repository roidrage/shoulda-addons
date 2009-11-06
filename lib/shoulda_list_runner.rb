module Color
  COLORS = { :clear => 0, :red => 31, :green => 32, :yellow => 33 }
  def self.method_missing(color_name, *args)
    color(color_name) + args.first + color(:clear) 
  end
  def self.color(color)
    "\e[#{COLORS[color.to_sym]}m"
  end
end

if defined?(MiniTest::Unit)
  module MiniTest
    class Unit
      class TestCase
        alias_method :run_before_shoulda_runner, :run
        
        def run runner
          result = run_before_shoulda_runner(runner)
          if result == '.'
            Color.green(name.gsub(/test: /, "")) + "\n"
          else
            Color.red(name.gsub(/test: /, "")) + "\n"
          end
        end
      end
    end
  end
else
  require 'test/unit/ui/console/testrunner'

  module Test
    module Unit
      module UI
        module Console
          class TestRunner
            def test_finished(name)
              if defined?(Test::Unit::Color)
                if is_fault?(name)
                  output(name.gsub(/test: /, ""), Test::Unit::Color.new("red"))
                else
                  output(name.gsub(/test: /, ""), Test::Unit::Color.new("green"))
                end
              else
                if is_fault?(name)
                  output(Color.red(name.gsub(/test: /, "")))
                else
                  output(Color.green(name.to_s.gsub(/test: /, "")))
                end
              end
            end
          
            def is_fault?(name)
              !_faults_by_name[name].nil?
            end
          
            def _faults_by_name
              @_faults_by_name ||= {}
            end
          
            def add_fault(fault)
              @faults << fault
              _faults_by_name[fault.test_name] = fault
            end
          end
        end
      end
    end
  end
end