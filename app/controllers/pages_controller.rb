class PagesController < ApplicationController
  def home
  end

  def admin
    @agrovet = Agrovet.find(params[:agrovet_id]) if params[:agrovet_id].present?
  @agrovets = Agrovet.all
  end

  def manager
    @agrovet = Agrovet.find(params[:agrovet_id]) if params[:agrovet_id].present?
    @agrovets = Agrovet.all
  end

  def salesrep
    # Find the current user's agrovets
    @agrovets = Agrovet.where(user_id: current_user.id)
  
    # Optionally, you can find a specific agrovet if an agrovet_id parameter is provided
    @agrovet = Agrovet.find_by(id: params[:agrovet_id]) if params[:agrovet_id]
  end
  

  def agrovetinfo
    @agrovet = Agrovet.find(params[:id])
  end

  def placeorder
    @agrovet = Agrovet.find(params[:id])
  end

  def allorders
    @agrovet = Agrovet.find(params[:id])
  end
  
end
