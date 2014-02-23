#!/usr/bin/ruby
# -*- coding:utf-8 -*-

require 'sinatra'
require 'feedzirra'

class App < Sinatra::Base
    @@atom_url = 'http://blog.takkyuuplayer.com/feeds/posts/summary'
    get '/' do
        feed = Feedzirra::Feed.fetch_and_parse(@@atom_url)
        erb :index, :locals => { :feed => feed }
    end

    get '/math' do
        erb :math
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

    get '/links' do
        erb :links
    end

    get '/author' do
        erb :author
    end
end

App.run!

1
