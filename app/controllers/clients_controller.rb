class ClientsController < ApplicationController
  CLIENTS_PER_PAGE = 10

  def index
    clients = Client.paginate(page: current_page, per_page: per_page)
    render json: clients
  end

  def update
    client = Client.find(client_params[:id])
    if client.update(phone: client_params[:phone])
      render status: :ok
    end
  end

  def upload
    CsvUpload.create(file: params[:file])
    CsvImport.start(params[:file])
    render status: :ok
  end

  private

  def client_params
    params.permit(:id, :phone)
  end

  def per_page
    params[:per_page] || CLIENTS_PER_PAGE
  end

  def current_page
    params[:page] || 1
  end
end