class ListController < ApplicationController

  get '/' do
    @lists = List.all

    erb :home
  end

  get '/insert' do
    erb :insert
  end

  post '/insert' do
    p params

    @list = List.new

    @list.amt = params[:amount]
    @list.item = params[:name]
    @list.brand = params[:brand]
    @list.reason = params[:desc]
    @list.save

    @message = 'Item added.'
    erb :message
  end

  get '/modify/:id' do

    @list = List.find(params[:id])

    erb :modify
  end

  post '/modify' do
    p params

    @list = List.find(params[:id])

    @list.amt = params[:amount]
    @list.item = params[:name]
    @list.brand = params[:brand]
    @list.reason = params[:desc]
    @list.save

    @message = 'Item added.'
    erb :message
  end

  get '/remove/:id' do

    @list = List.find(params[:id])

    erb :remove
  end
  post '/remove' do

    @list = List.find(params[:id])
    List.destroy(params[:id])

    @message = 'Item removed.'
    erb :message
  end

  ##additional views for later
  # get '/calculator' do
  #   erb :calc
  #
  # end
  #
  # get '/history' do
  #   erb :history
  #
  # end

end
