class CsvImport
  def self.start(file)
    upload = CsvUpload.new(file: file)
    
    if upload.save
      CsvExportWorker.perform_async(upload.id)
      {status: :ok}
    else
      {status: :error, message: upload.errors.full_messages}
    end
  end
end