FROM debian:jessie

#Install synapse and nerve
RUN  apt-get update && apt-get install -y build-essential ruby-dev ruby git curl zlib1g-dev libreadline6-dev libyaml-dev libssl-dev

WORKDIR /nerve
ADD lib lib/
ADD bin bin/
ADD example example/
ADD Gemfile Gemfile
ADD Gemfile.lock Gemfile.lock
ADD nerve.gemspec nerve.gemspec

RUN gem build *.gemspec; gem install *.gem

ENTRYPOINT ["bin/nerve"]