class FiguresController < ApplicationController

    get '/figures' do
      @figures = Figure.all
      erb :'figures/index'
    end

    get '/figures/new' do
      @landmarks = Landmark.all
      erb :'/figures/new'
    end

    post '/figures' do
      @figure = Figure.create(params[:name])
      @figure.landmark = @landmark
    end

    get '/figures/:id' do
      @figure = Figure.find(params[:id])
      erb :'figures/show'
   end
end
