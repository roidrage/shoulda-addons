Like RSpec's profiling of the 10 slowest test cases? Like how it can print out the full test names in shiny and colorful terminal awesomeness instead of meaningless dots? Me too.

    require 'shoulda_benchmark'

Patches Shoulda to track runtimes of all your tests, showing you the 10 slowest.

    require 'shoulda_list_runner'

Patches Test::Unit to print out test names colored either red or green (you can guess which is which). Blatantly inspired by RedGreen and adapted for Shoulda awesomeness.

`require 'shoulda_addons'` if you want both, and why wouldn't you?

Install from gemcutter via: `gem install shoulda-addons`

Is it safe for Ruby 1.9? Yes! Support for the new MiniTest framework is built-in.

Author: Mathias Meyer <meyer@paperplanes.de>

#### Contributions

* Test::Unit 2.0 compatibility (github.com/ffmike)
* Include the test class name in the benchmark output for Test::Unit (github.com/tobias)