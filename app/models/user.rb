class User < ApplicationRecord
  has_secure_password

  has_many :messages

  has_many :user_rooms
  has_many :rooms, through: :user_rooms

  has_many :timetables, dependent: :destroy
  has_many :automails, dependent: :destroy
  has_many :requests

  mount_uploader :image, ImageUploader

  # フォローをした、されたの関係
  has_many :follows, class_name: "Follow", foreign_key: "from_id", dependent: :destroy
  has_many :reverse_of_relationships, class_name: "Follow", foreign_key: "to_id", dependent: :destroy

  # 一覧画面で使う
  has_many :followings, through: :follows, source: :to
  has_many :followers, through: :reverse_of_relationships, source: :from

  # フォローしたときの処理
  def follow(user_id)
    follows.create(to_id: user_id)
  end
  # フォローを外すときの処理
  def unfollow(user_id)
    follows.find_by(to_id: user_id).destroy
  end
  # フォローしているか判定
  def following?(user)
    followings.include?(user)
  end
end
