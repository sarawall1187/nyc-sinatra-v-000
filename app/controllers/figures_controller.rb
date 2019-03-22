class FiguresController < ApplicationController

    get '/figures' do
      @figures = Figure.all
      erb :'figures/index'
    end

    get '/figures/new' do
      @landmarks = Landmark.all
      @titles = Title.all
      erb :'/figures/new'
    end

    post '/figures' do
      @landmark = Landmark.find_or_create_by(params)
      @title = Title.find_or_create_by(params)
      @figure = Figure.create(params[:name])
      @figure.landmark = @landmark
      @figure.title = @title
      @figure.save
      redirect to '/figures/:id'
    end

    get '/figures/:id' do
      @figure = Figure.find(params[:id])
      erb :'figures/show'
   end
end
