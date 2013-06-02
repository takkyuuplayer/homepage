#!/usr/bin/ruby
# -*- coding:utf-8 -*-

require 'sinatra'

get '/' do
  erb :index
end

get '/webapp' do
  erb :webapp
end

get '/webapp/:name' do |app|
  erb app.to_sym
end

get '/software' do
  erb :software
end

get '/future' do
  erb :future
end

get '/author' do
  erb :author
end
