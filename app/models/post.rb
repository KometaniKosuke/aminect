class Post < ApplicationRecord
  belongs_to :user
  mount_uploader :post_img, PostImgUploader
end
