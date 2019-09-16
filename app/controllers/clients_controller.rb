class ClientsController < ApplicationController
  CLIENTS_PER_PAGE = 30

  def index
    render json: Client.paginate(page: current_page, per_page: per_page)
  end

  private

  def per_page
    params[:per_page] || CLIENTS_PER_PAGE
  end

  def current_page
    params[:page] || 1
  end
end