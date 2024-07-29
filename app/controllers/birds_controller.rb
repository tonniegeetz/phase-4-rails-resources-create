class BirdsController < ApplicationController
  # GET /birds
  def index
    birds = Bird.all
    render json: birds
  end

  # GET /birds/:id
  # params[:id] refers to the dynamic part of our route, defined by :id
  # a request to /birds/2 would give params[:id] a value of 2
  def show
    bird = Bird.find_by(id: params[:id])
    if bird
      render json: bird
    else
      render json: { error: 'Bird not found' }, status: :not_found
    end
  end

  # POST /birds
  def create
    bird = Bird.create(name: params[:name], species: params[:species])
    render json: bird, status: :created
  end
end
