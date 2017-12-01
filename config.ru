#!/usr/bin/ruby
# -*- coding:utf-8 -*-

require 'sinatra'
require 'feedjira'

class App < Sinatra::Base
    set :bind, '0.0.0.0'

    @@google_atom = 'https://takkyuuplayer.blogspot.com/feeds/posts/summary'
    @@hatena_atom = 'http://takkyuuplayer.hatenablog.com/feed'

    get '/' do
        gf = Feedjira::Feed.fetch_and_parse(@@google_atom)
        hf = Feedjira::Feed.fetch_and_parse(@@hatena_atom)
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

    get '/author' do
        erb :author
    end
end

App.run!

1
