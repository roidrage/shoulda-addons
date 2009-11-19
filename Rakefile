begin
  require 'jeweler'
  Jeweler::Tasks.new do |s|
    s.name = "shoulda-addons"
    s.summary = %Q{Neat addons for Shoulda, because Shoulda is neat.}
    s.email = "meyer@paperplanes.de"
    s.homepage = "http://github.com/mattmatt/shoulda-addons"
    s.description = "Some awesome addons for Shoulda to benchmark tests, or to get nicer output than just a dot, because what the dot?"
    s.authors = ["Mathias Meyer"]
    s.files = FileList["[A-Z]*.*", "lib/**/*"]
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler not available. Install it with: sudo gem install jeweler -s http://gemcutter.org"
end

task :test do
  system "ruby test/shoulda_benchmark_test_unit_1x_test.rb"
  system "ruby test/shoulda_benchmark_test_unit_2x_test.rb"
  system "ruby1.9 test/shoulda_benchmark_minitest_test.rb"
  system "ruby test/shoulda_list_runner_test_unit_1x_test.rb"
  system "ruby test/shoulda_list_runner_test_unit_2x_test.rb"
  system "ruby1.9 test/shoulda_list_runner_minitest_test.rb"
end