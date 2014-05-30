class SupportersController < ApplicationController

before_action :find_supporter, only: [:show, :edit, :update, :destroy]

  def index
    @supporters = Supporter.all
  end

  def new
    @supporter = Supporter.new
  end

  def create
    @supporter = Supporter.new supporter_attributes
    
    if @supporter.save
      redirect_to supporters_path, notice: "Supporter created successfully"
   else 
        #renders a new template if left blank it would have 
        #rendered create as that is the default after the end of this method
        flash.now[:alert]="Problem saving question"
        render :new
    end
 
  end

  def show
  end

  def edit
  end
 
  def update
    if @supporter.update_attributes supporter_attributes
      redirect_to supporters_path, notice: " Supporter Updated successfully"    #redirect to the show page
    else
      render :edit
    end 
  end


  def destroy
    @supporter.destroy
    redirect_to supporters_path, notice: "Supporter deleted Successfully"
  end


  private

  
  def find_supporter
       @supporter = Supporter.find params[:id]
    end

  def supporter_attributes
   params.require(:supporter).permit(:name, :email, :department, :message)
  end

end

