require 'csv'

class ClientsFromCsv
  CLIENT_COLUMNS = [:firstname, :lastname, :email, :phone]
  IMPORT_LIMIT = 1000

  def self.import(file)
    new.import(file)
  end

  def import(file)
    file_path = ActiveStorage::Blob.service.send(:path_for, file.key)
    batch = []

    CSV.foreach(file_path, headers: true) do |row|
      batch << row_to_columns(row)
      next if batch.size < IMPORT_LIMIT

      import_batch(batch)
      batch = []
    end

    import_batch(batch) unless batch.empty?
  end

  private

  def import_batch(batch)
    Client.import CLIENT_COLUMNS, batch
  end

  def row_to_columns(row)
    [row['First name'], row['Last name'], row['Email'], row['Phone number']]
  end
end