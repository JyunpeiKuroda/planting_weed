class Post < ApplicationRecord
  has_one_attached :photo

  # mount_uploader :file, ImageUploader
  # validates_integrity_of :file
  # validates_processing_of :file
  # validates_download_of :file

end
