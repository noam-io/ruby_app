TARGET_ROOT="./UniversalRuby"

# Builds native gems, so needs to be run with a
gem install eventmachine -v 1.0.3 -i $TARGET_ROOT/lib/ruby/gems/2.1.0 --no-ri --no-rdoc
gem install http_parser.rb -v 0.5.3 -i $TARGET_ROOT/lib/ruby/gems/2.1.0 --no-ri --no-rdoc
gem install thin -v 1.4.1 -i $TARGET_ROOT/lib/ruby/gems/2.1.0 --no-ri --no-rdoc
