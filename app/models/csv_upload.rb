class CsvUpload < ApplicationRecord
  ALLOWED_FILE_EXTENSIONS = %w(csv)

  has_one_attached :file
  validates :file, presence: true
  validate :file_extension

  private
  
  def file_extension
    return if ALLOWED_FILE_EXTENSIONS.include? file.attachment.blob.filename.extension

    errors.add(:file, I18n.t('errors.file_extension_invalid', types: ALLOWED_FILE_EXTENSIONS))
  end
end
