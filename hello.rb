#!/usr/bin/ruby
# -*- coding:utf-8 -*-

require 'sinatra'

get '/' do
  erb :index
end

get '/webapp' do
  erb :webapp
end

get '/author' do
  erb :author
end
