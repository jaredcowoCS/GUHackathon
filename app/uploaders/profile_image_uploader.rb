class ProfileImageUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  # include CarrierWave::MiniMagick
  include Cloudinary::CarrierWave

  process resize_to_fit: [250, 250]
  process :convert => 'png'

  version :tiny do
    process :resize_to_fill => [85, 85]
  end

  def extension_whitelist
     %w(jpg jpeg gif png)
  end

end
