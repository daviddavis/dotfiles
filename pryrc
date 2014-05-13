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

# aliases for debugging
Pry.config.commands.alias_command "q", "exit-all"
Pry.config.commands.alias_command "n", "next"
Pry.config.commands.alias_command "c", "continue"

# Launch Pry with access to the entire Rails stack
rails = File.join(Dir.getwd, 'config', 'environment.rb')

if File.exist?(rails) && ENV['SKIP_RAILS'].nil?
  require rails
  require 'rails/console/app'
  require 'rails/console/helpers'

  # Add Rails console helpers (like `reload!`) to pry
  if defined?(Rails::ConsoleMethods)
    extend Rails::ConsoleMethods
  end
end

# --------------------------------------------------------
# KATELLO
# --------------------------------------------------------

def login(user = nil)
  user ||= User.admin || User.hidden.first || User.first
  User.current = user
end
