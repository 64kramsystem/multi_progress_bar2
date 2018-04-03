$LOAD_PATH << File.expand_path('lib', __dir__)

require 'multi_progress_bar/version'

Gem::Specification.new do |s|
  s.name = "multi_progress_bar2"
  s.date = "2018-04-03"
  s.version = MultiProgressBar::VERSION
  s.summary = "Displays multiple progress bars using Ncurses."
  s.description  = "Fork of multi_progress_bar, using `curses` instead of the defunct `ncurses`"
  s.email = "peter.a.jaros@gmail.com"
  s.homepage = "https://github.com/saveriomiroddi/multi_progress_bar2"
  s.authors = ["Peter Jaros"]

  s.add_dependency "curses", "~> 1.2.4"
  s.add_dependency "ruby-progressbar", "0.0.9"
end