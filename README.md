# Ruby.app

Universal application wrapper to deploy Ruby apps on OS X (using MRI/C Ruby, not MacRuby or JRuby). Has very specific native gem dependencies: not everything will just work.

The idea is that `Ruby.app` contains a full, universal Ruby installation. All you have to do is provide a `main.rb` file inside the `Ruby.app/Contents/Resources/` folder that starts your application.

# Using

1. Run `rake build` to download and build a ruby install with eventmachine and thin gem dependencies.
2. Open the XCode project and build it.
3. Run `tar -zcvf ruby-mac-wrapper-2014-02-03.tar.gz ./Ruby.app` to create an archive suitable for use with Releasy.

# License

Everything in this repository has been released under the MIT license. As for the Ruby installation that is contained in binary builds of the `Ruby.app`, please see the licenses for Ruby and its standard library.
