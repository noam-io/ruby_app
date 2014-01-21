root=$PWD
tmp=$root/tmp

RVM_RUBY="ruby-2.1.0"
RUBY_ARCHIVE_NAME="$RVM_RUBY.tar.bz2"
BINARY_RUBY_BZIP_URL="https://rvm.io/binaries/osx/10.7/x86_64/$RUBY_ARCHIVE_NAME"
RUBY_BZIP_DESTINATION=tmp/$RUBY_ARCHIVE_NAME
RUBY_UNZIPPED_DESTINATION=tmp/$RVM_RUBY
TARGET_ROOT="./UniversalRuby"

mkdir -p tmp

if [ -f $RUBY_BZIP_DESTINATION ]
then
  echo "$RVM_RUBY is already downloaded"
else
  echo "Downloading Ruby to $RUBY_BZIP_DESTINATION..."
  wget $BINARY_RUBY_BZIP_URL -O $RUBY_BZIP_DESTINATION
fi

if [ -d $RUBY_UNZIPPED_DESTINATION ]
then
  echo "$RVM_RUBY is already unzipped"
else
  echo "Unzipping Ruby to $RUBY_UNZIPPED_DESTINATION..."
  tar yxvf $RUBY_BZIP_DESTINATION -C tmp
fi

echo "Copying $RVM_RUBY into $TARGET_ROOT..."
rm -rf $TARGET_ROOT
cp -R $RUBY_UNZIPPED_DESTINATION $TARGET_ROOT

echo "Installing gems..."


mv UniversalRuby/include/ruby-2.1.0/x86_64-darwin12.0 UniversalRuby/include/ruby-2.1.0/x86_64

