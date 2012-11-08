# vim FTW
Pry.config.editor = "vim"

# load rails console helpers
if Kernel.const_defined?("Rails") then
  require File.join(Rails.root,"config","environment")
  require 'rails/console/app'
  require 'rails/console/helpers'
  Pry::RailsCommands.instance_methods.each do |name| 
    Pry::Commands.command name.to_s do 
      Class.new.extend(Pry::RailsCommands).send(name)
    end
  end
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