require 'rubygems'

require 'eventmachine'

begin
  puts system("ifconfig 2>&1")
rescue => e
  puts e
end

$x = 0
while true
    puts "#{$x}. ohai osx!"
    sleep 1
    $x += 1
end