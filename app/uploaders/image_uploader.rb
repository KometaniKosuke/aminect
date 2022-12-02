class ImageUploader < CarrierWave::Uploader::Base
  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  include CarrierWave::MiniMagick
  process resize_to_fit: [400, 200]

  # Choose what kind of storage to use for this uploader:
  storage :file
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  #アップロードした画像の表示---------------
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
  #デフォルト画像の設定
  def default_url
    "account.png"
  end
  #-------------------------------------
  version :thumb do
    process resize_to_fit: [200, 200]
  end
  version :thumb50 do
    process resize_to_fit: [100, 100]
  end
  def extension_allowlist
    %w(jpg jpeg gif png)
  end
end
