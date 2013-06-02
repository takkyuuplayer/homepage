#!/usr/bin/ruby
# -*- coding:utf-8 -*-

require 'sinatra'

get '/' do
  erb :index
end

get '/author' do
  erb :author
end
