class ProfileImageUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  storage :file
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def cache_dir
    "#{Rails.root}/tmp/uploads"
  end

  process :auto_orient
  process resize_to_fit: [250, 250]

  def auto_orient
    manipulate! do |image|
      image.tap(&:auto_orient)
    end
  end

  version :tiny do
    process :resize_to_fill => [75, 75]
  end

  def extension_whitelist
     %w(jpg jpeg gif png)
  end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end

end
