FROM ruby:2.5  
RUN apt-get update -qq && apt-get install -y nodejs  
RUN mkdir /cassandapp  
WORKDIR /cassandapp  
ADD Gemfile /cassandapp/Gemfile  
ADD Gemfile.lock /cassandapp/Gemfile.lock  
RUN bundle install  
ADD . /cassandapp  
RUN rake assets:precompile  
EXPOSE 3000  
CMD ["rails", "server", "-b", "0.0.0.0"] 
