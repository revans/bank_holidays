require 'date'
require 'time'

base = File.expand_path(File.dirname(__FILE__))
Dir[File.join(base, 'core_ext', '*.rb')].each { |file| require file }