class CampersController < ApplicationController

    before_action :find_camper, only: :show

    def index
        render json: Camper.all 
    end

    def show
        render json: @camper, serializer: CamperActivitesSerializer
    end

    def create 
        camper = Camper.create!(camper_params)
        render json: camper, status: :created
    end

    private 
    
    def camper_params
        params.permit(:name, :age)
    end

    def find_camper
        @camper = Camper.find(params[:id])
    end
end
