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
      @landmark = Landmark.find_or_create_by(:name => params[:landmark][:name])
      @title = Title.find_or_create_by(:name => params[:title][:name])
      @figure = Figure.create(:name => params[:figure][:name])

      redirect to '/figures/:id'
    end

    get '/figures/:id' do
      binding.pry
      @figure = Figure.find_by(params[:figure][:name])
      @title = Title.find_by(params[:title][:name])
      @landmark = Landmark.find_by(params[:landmark][:name])
      erb :'figures/show'
   end
end

# @figure.name = params[:figure][:name]
# @landmark.name = params[:landmark][:name]
# @landmark.year_completed = params[:landmark][:year_completed]
# @title.name = params[:title][:name]
# @figure.save
# binding.pry
