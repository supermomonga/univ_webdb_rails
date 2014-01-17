FROM ubuntu:12.10
MAINTAINER brian@morearty.org
# Install dependencies.
RUN apt-get update
RUN apt-get install -y curl git build-essential ruby1.9.3 libsqlite3-dev
RUN gem install rubygems-update --no-ri --no-rdoc
RUN update_rubygems
RUN gem install bundler sinatra --no-ri --no-rdoc
# Copy the app into the image.
ADD railsapp /opt/railsapp
# Now that the app is here, we can bundle.
WORKDIR /opt/railsapp
RUN bundle install
# Set up a default runtime command
CMD rails server thin
