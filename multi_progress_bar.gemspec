Gem::Specification.new do |s|
  s.name = "multi_progress_bar"
  s.version = '0.3.1'
  s.summary = "Displays multiple progress bars using Ncurses."
  s.description = "Displays multiple progress bars using Ncurses.  Useful for displaying the status of multiple test runs, say, distributed across different machines.  Which is exactly why I wrote it."
  s.email = "peter.a.jaros@gmail.com"
  s.homepage = "http://github.com/Peeja/multi_progress_bar/tree/master/"
  s.authors = ["Peter Jaros"]

  s.add_dependency "ffi-ncurses"
  s.add_dependency "ruby-progressbar", "0.0.9"
end