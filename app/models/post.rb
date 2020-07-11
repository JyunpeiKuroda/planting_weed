class Post < ApplicationRecord
  has_one_attached :photo

  # mount_uploader :file, ImageUploader
  # validates_integrity_of :file
  # validates_processing_of :file
  # validates_download_of :file
  validate :image_type

  def image_type
    if photo.attached? && photo.content_type.in?(%("photo/jpeg photo/png"))
      errors.add(:photo, 'error message')
    elsif !photo.attached?
      errors.add(:photo, 'error message')
    end
  end

end
