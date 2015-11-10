# vim FTW
Pry.config.editor = "vim"

# Load 'awesome_print'
begin
  require 'awesome_print'
  AwesomePrint.pry!
rescue LoadError => err
end

# how about some hirb
begin
  require 'hirb'
rescue LoadError
  # Missing goodies, bummer
end

# aliases for debugging
Pry.config.commands.alias_command "q", "exit-all"
begin
  Pry.config.commands.alias_command "n", "next"
  Pry.config.commands.alias_command "s", "step"
  Pry.config.commands.alias_command "c", "continue"
rescue
end

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
  user ||= User.only_admin.first || User.hidden.first || User.first
  User.current = user
end
