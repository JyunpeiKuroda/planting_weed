class Post < ApplicationRecord
  mount_uploader :file, ImageUploader

  validates_integrity_of :file
  validates_processing_of :file
  validates_download_of :file

end
