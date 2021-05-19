FROM ruby:2.7  
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt update -yqq && apt install yarn -yqq && apt install --no-install-recommends yarn -yqq
COPY myapp /usr/src/app/ 
WORKDIR /usr/src/app 
RUN bundle install
RUN bundle exec rails webpacker:install