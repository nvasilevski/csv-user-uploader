class CsvExportWorker
  include Sidekiq::Worker

  def perform(upload_id)
    upload = CsvUpload.find(upload_id)
    
    ClientsFromCsv.import(upload.file)
  end
end