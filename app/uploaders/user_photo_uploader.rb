# encoding: utf-8
class UserPhotoUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  version :thumb do
    resize_to_fill(50, 50)
  end

end
