$LOAD_PATH << File.expand_path('lib', __dir__)

require 'multi_progress_bar/version'

Gem::Specification.new do |s|
  s.name = "multi_progress_bar2"
  s.date = "2018-04-01"
  s.version = MultiProgressBar::VERSION
  s.summary = "Displays multiple progress bars using Ncurses."
  s.description  = "Fork of multi_progress_bar, using the (fixed) `ffi-ncurses2` instead of the defunct `ncurses`"
  s.email = "peter.a.jaros@gmail.com"
  s.homepage = "http://github.com/Peeja/multi_progress_bar/tree/master/"
  s.authors = ["Peter Jaros"]

  s.add_dependency "ffi-ncurses2", "~> 0.4.1"
  s.add_dependency "ruby-progressbar", "0.0.9"
end