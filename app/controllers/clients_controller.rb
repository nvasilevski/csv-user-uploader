class ClientsController < ApplicationController
  CLIENTS_PER_PAGE = 30

  def index
    clients = Client.paginate(page: current_page, per_page: per_page)
    render json: ClientSerializer.new(clients).serialized_json
  end

  def upload
    CsvUpload.create(file: params[:file])
    CsvImport.start(params[:file])
    render status: :ok
  end

  private

  def per_page
    params[:per_page] || CLIENTS_PER_PAGE
  end

  def current_page
    params[:page] || 1
  end
end