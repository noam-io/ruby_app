desc "Build a Ruby app shell for OSX"
task :build do
  puts "Make sure you're on a Ruby 2.1.0 that can compile (via `rvm use 2.1.0` or other means)"
  puts "Otherwise your binary gems may silently fail to build and blow up at runtime."
  system("bash", "build.sh")
  system("bash", "gems.sh")
end

desc "Clean up after install"
task :clean do
  sh "rm -rf Ruby.app"
  sh "rm -rf UniversalRuby"
end
