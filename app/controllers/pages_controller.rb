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
    @pending_orders = Order.where(status: ['Pending', 'pending'])
  end

  def pendingorders
    @agrovet = Agrovet.find(params[:agrovet_id]) if params[:agrovet_id].present?
    @agrovets = Agrovet.all
    @pending_orders = Order.where(status: ['Pending', 'pending'])
  end

  def dispatchedorders
    @agrovet = Agrovet.find(params[:agrovet_id]) if params[:agrovet_id].present?
    @agrovets = Agrovet.all
    @dispatched_orders = Order.where(status: ['Dispatched', 'dispatched'])
    @pending_orders = Order.where(status: ['Pending', 'pending'])
  end

  def receivedorders
    @agrovet = Agrovet.find(params[:agrovet_id]) if params[:agrovet_id].present?
    @agrovets = Agrovet.all
    @dispatched_orders = Order.where(status: ['Dispatched', 'dispatched'])
    @pending_orders = Order.where(status: ['Pending', 'pending'])
    @received_orders = Order.where(status: ['Received', 'received'])
  end

  def allagrovets
    @agrovet = Agrovet.find(params[:agrovet_id]) if params[:agrovet_id].present?
    @agrovets = Agrovet.all
    @dispatched_orders = Order.where(status: ['Dispatched', 'dispatched'])
    @pending_orders = Order.where(status: ['Pending', 'pending'])
    @received_orders = Order.where(status: ['Received', 'received'])
  end

  def allsalesreps
    @agrovet = Agrovet.find(params[:agrovet_id]) if params[:agrovet_id].present?
    @agrovets = Agrovet.all
    @dispatched_orders = Order.where(status: ['Dispatched', 'dispatched'])
    @pending_orders = Order.where(status: ['Pending', 'pending'])
    @received_orders = Order.where(status: ['Received', 'received'])
    @salesreps = User.where(role: [0])
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
