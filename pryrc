# vim FTW
Pry.config.editor = "vim"

# Load 'awesome_print'
begin
  require 'awesome_print'
  Pry.config.print = proc { |output, value| Pry::Helpers::BaseHelpers.stagger_output("=> #{value.ai}", output) }
rescue LoadError => err
end

# how about some hirb
begin
  require 'hirb'
rescue LoadError
  # Missing goodies, bummer
end

if defined? Hirb
  # Dirty hack to support in-session Hirb.disable/enable
  Hirb::View.instance_eval do
    def enable_output_method
      @output_method = true
      Pry.config.print = proc do |output, value|
        Hirb::View.view_or_page_output(value) || Pry::DEFAULT_PRINT.call(output, value)
      end
    end

    def disable_output_method
      Pry.config.print = proc { |output, value| Pry::DEFAULT_PRINT.call(output, value) }
      @output_method = nil
    end
  end

  Hirb.enable
else
  puts "Gem hirb not found. Skipping..."
end

# Toys methods
# See https://gist.github.com/807492
class Array
  def self.toy(n=10, &block)
    block_given? ? Array.new(n,&block) : Array.new(n) {|i| i+1}
  end
end

class Hash
  def self.toy(n=10)
    Hash[Array.toy(n).zip(Array.toy(n){|c| (96+(c+1)).chr})]
  end
end

# aliases for debugging
Pry.config.commands.alias_command "q", "exit-all"
Pry.config.commands.alias_command "n", "next"
Pry.config.commands.alias_command "c", "continue"

# Launch Pry with access to the entire Rails stack
rails = File.join(Dir.getwd, 'config', 'environment.rb')

if File.exist?(rails) && ENV['SKIP_RAILS'].nil?
  require rails

  if Rails.version[0..0] == "2"
    require 'console_app'
    require 'console_with_helpers'
  elsif Rails.version[0..0] == "3"
    require 'rails/console/app'
    require 'rails/console/helpers'
  else
    warn "[WARN] cannot load Rails console commands (Not on Rails2 or Rails3?)"
  end

  # [] acts as find()
  ActiveRecord::Base.instance_eval { alias :[] :find } if defined?(ActiveRecord)

  # Add Rails console helpers (like `reload!`) to pry
  if defined?(Rails::ConsoleMethods)
    extend Rails::ConsoleMethods
  end

  # r! to reload Rails console
  def r!
    reload!
  end

  # sql for arbitrary SQL commands through the AR
  def sql(query)
    ActiveRecord::Base.connection.execute(query)
  end
end

# --------------------------------------------------------
# KATELLO
# --------------------------------------------------------

def login
  User.current = (User.hidden.first || User.first)
end
