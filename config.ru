require '/home/snappish/.gem/ruby/1.8/gems/rack-1.1.0/lib/rack.rb'
require '/home/snappish/.gem/ruby/1.8/gems/sinatra-0.9.4/lib/sinatra.rb'
require 'generation.rb'


Sinatra::Application.default_options.merge!(
  :run => false,
    :env => :production,
      :raise_errors => true
      )

run Sinatra::Application

