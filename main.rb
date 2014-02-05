require 'rubygems'

require 'eventmachine'

#begin
#  puts system("ifconfig 2>&1")
#rescue => e
#  puts e
#end

system("echo 'ruby process starting' >> /tmp/startups.txt");

$x = 0
while true
    puts "#{$x}. ohai osx!"
    if Process.ppid == 1
      puts "Parent process (.app) died, so I'm stopping"
      break
    end
    sleep 1
    $x += 1
end
