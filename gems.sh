TARGET_ROOT="./UniversalRuby"

# Builds native gems, so needs to be run with a
gem install eventmachine -i $TARGET_ROOT/lib/ruby/gems/2.1.0 --no-ri --no-rdoc
gem install thin -i $TARGET_ROOT/lib/ruby/gems/2.1.0 --no-ri --no-rdoc
