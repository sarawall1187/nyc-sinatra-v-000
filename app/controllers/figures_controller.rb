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
      @figure = Figure.create(params[:figure])
      if !params[:title][:name].empty?
        @figure.titles << Title.create(params[:title])
      end
      if !params[:landmark][:name].empty?
        @figure.landmarks << Landmark.create(params[:landmark])
      end
      # binding.pry
      redirect to "/figures/#{@figure.id}"
    end

    get '/figures/:id' do
      # binding.pry
      @figure = Figure.find(params[:id])
      # @title = Title.find_by(params[:title][:name])
      # @landmark = Landmark.find_by(params[:landmark][:name])
      erb :'figures/show'
   end
end

# @figure.name = params[:figure][:name]
# @landmark.name = params[:landmark][:name]
# @landmark.year_completed = params[:landmark][:year_completed]
# @title.name = params[:title][:name]
# @figure.save
# binding.pry
