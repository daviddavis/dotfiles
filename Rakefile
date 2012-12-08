require 'rake'
require 'erb'

desc "run rake install"
task :default do
  Rake::Task["install"].execute
end

require 'rake'
require 'erb'

desc "install the dot files into user's home directory"
task :install do
  Dir['*'].each do |file|
    next if %w[Rakefile README.rdoc README.md LICENSE install.sh vendor].include? file

    if File.exist?(File.join(ENV['HOME'], ".#{file.sub('.erb', '')}"))
      file_name = file.sub('.erb', '')
      if File.identical? file, File.join(ENV['HOME'], ".#{file_name}")
        puts "identical ~/.#{file.sub('.erb', '')}"
      else
        puts "backing up ~/.#{file_name} to ~/.#{file_name}.backup"
        old_file = File.join(ENV['HOME'], ".#{file_name}")
        system %Q{mv #{old_file} #{old_file}.backup}
        link_file(file)
      end
    else
      link_file(file)
    end
  end
end

def replace_file(file)
  system %Q{rm -rf "$HOME/.#{file.sub('.erb', '')}"}
  link_file(file)
end

def link_file(file)
  if file =~ /.erb$/
    puts "generating ~/.#{file.sub('.erb', '')}"
    File.open(File.join(ENV['HOME'], ".#{file.sub('.erb', '')}"), 'w') do |new_file|
      new_file.write ERB.new(File.read(file)).result(binding)
    end
  else
    puts "linking ~/.#{file}"
    system %Q{ln -s "$PWD/#{file}" "$HOME/.#{file}"}
  end
end