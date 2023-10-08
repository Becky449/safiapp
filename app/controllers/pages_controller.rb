class PagesController < ApplicationController
  def home
  end

  def admin
  end

  def salesrep
    @agrovet = Agrovet.find_by(id: params[:agrovet_id])
  end
end
