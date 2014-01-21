require 'rubygems'

require 'eventmachine'

$x = 0
while true
    puts "#{$x}. ohai osx!"
    sleep 1
    $x += 1
end