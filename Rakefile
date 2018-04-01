require 'rdoc/task'

desc 'Generate RDoc documentation.'
Rake::RDocTask.new(:rdoc) do |rdoc|
  rdoc.main = "README.rdoc"
  rdoc.rdoc_dir = 'doc'
  # Point to the original project, as the API is not changed.
  rdoc.options << '--webcvs=http://github.com/Peeja/multi_progress_bar/tree/master/'
end
