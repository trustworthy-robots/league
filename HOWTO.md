Dependencies
---
* Ruby 2.3.1. Install with `rvm install 2.3.1` or `rbenv install 2.3.1`
* gem Bundler. Install with `gem install bundler`

_(All other gems are installed on the fly)_

Run application
---
* `ruby ranking_table_runner.rb < sample-input.txt` -- captures standard output
* `cat sample-input.txt | ruby ranking_table_runner.rb` -- captures standard output (pipe)
* `ruby ranking_table_runner.rb sample-input.txt` -- reads from file
* `ranking_table_spec_runner.rb` -- runs tests
