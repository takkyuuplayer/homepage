#!/usr/bin/ruby
# -*- coding:utf-8 -*-

require 'sinatra'
require 'feedzirra'

class App < Sinatra::Base
    @@google_atom = 'http://blog.takkyuuplayer.com/feeds/posts/summary'
    @@hatena_atom = 'http://takkyuuplayer.hatenablog.com/feed'
    get '/' do
        gf = Feedzirra::Feed.fetch_and_parse(@@google_atom)
        hf = Feedzirra::Feed.fetch_and_parse(@@hatena_atom)
        erb :index, :locals => { :google_feed => gf,
                                 :hatena_feed => hf
        }
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
