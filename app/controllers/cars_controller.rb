class CarsController < ApplicationController
  before_action :set_car, only: [:show, :edit, :update, :destroy]
  
    def index
      @cars = current_team.cars.ordered

    end
  
    def generate_data
      GenerateDataJob.perform_later(current_team.id)

      respond_to do |format|
        format.html { redirect_to cars_path, notice: "Generate data job was successfully started." }
        format.turbo_stream { flash.now[:notice] = "Generate data job was successfully started." }
      end
    end

    def show
    end
    
    def new
      @car = Car.new
    end
  
    def create
      # Only this first line changes to make sure the association is created
      @car = current_team.cars.build(car_params)

      if @car.save
        respond_to do |format|
          format.html { redirect_to cars_path, notice: "Car was successfully created." }
          format.turbo_stream { flash.now[:notice] = "Car was successfully created." }
        end
      else
        render :new
      end
    end
  
    def edit
    end
  
    def update
      if @car.update(car_params)
        respond_to do |format|
          format.html { redirect_to cars_path, notice: "Car was successfully updated." }
          format.turbo_stream { flash.now[:notice] = "Car was successfully updated." }
        end
      else
        render :edit, status: :unprocessable_entity
      end
    end
  
    def destroy
      @car.destroy
      respond_to do |format|
        format.html { redirect_to cars_path, notice: "Car was successfully destroyed." }
        format.turbo_stream { flash.now[:notice] = "Car was successfully destroyed." }
      end
    end
  
    private
  
    def set_car
      @car = current_team.cars.find(params[:id])
    end
  
    def car_params
      params.require(:car).permit(:name)
    end
  end