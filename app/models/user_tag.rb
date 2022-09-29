class UserTag < ApplicationRecord
  belongs_to :user
  belongs_to :tag

  # mount_uploader :tag_image, TagUploader
end
