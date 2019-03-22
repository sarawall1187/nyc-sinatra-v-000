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
      @landmark = Landmark.find_or_create_by(params[:id])
      @title = Title.find_or_create_by(params[:id])
      @figure = Figure.create(params[:id])
      @figure.name = params[:figure][:name]
      @landmark.name = params[:landmark][:name]
      @landmark.year_completed = params[:landmark][:year_completed]
      @title = params[:title][:name]

      @figure.save
      redirect to '/figures/:id'
    end

    get '/figures/:id' do
      @figure = Figure.find_by(params[:name])

      erb :'figures/show'
   end
end
