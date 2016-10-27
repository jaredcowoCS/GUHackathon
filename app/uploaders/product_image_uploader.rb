class ProductImageUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  # include CarrierWave::MiniMagick
  include Cloudinary::CarrierWave

  process :auto_orient
  process resize_to_fit: [250, 250]

  def auto_orient
    manipulate! do |image|
      image.tap(&:auto_orient)
    end
  end

  version :normal do
    process :resize_to_fill => [240, 240]
  end

  version :tiny do
    process :resize_to_fill => [70, 70]
  end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_whitelist
     %w(jpg jpeg gif png)
  end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end

end
