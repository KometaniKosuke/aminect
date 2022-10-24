class User < ApplicationRecord
  has_secure_password

  has_many :messages

  has_many :user_rooms
  has_many :rooms, through: :user_rooms

  has_many :timetables, dependent: :destroy

  has_many :user_tags
  has_many :tags, through: :user_tags

  mount_uploader :image, ImageUploader
  attr_accessor :current_password

  # フォローをした、されたの関係
  has_many :follows, class_name: "Follow", foreign_key: "from_id", dependent: :destroy
  has_many :reverse_of_relationships, class_name: "Follow", foreign_key: "to_id", dependent: :destroy

  # 一覧画面で使う
  has_many :followings, through: :follows, source: :to
  has_many :followers, through: :reverse_of_relationships, source: :from

  has_many :posts, dependent: :destroy
  has_many :announces

  # ブロックをした、されたの関係
  has_many :deals, class_name: "Deal", foreign_key: "from_id", dependent: :destroy
  has_many :reverse_of_deals, class_name: "Deal", foreign_key: "to_id", dependent: :destroy

  # 一覧画面で使う
  has_many :blockings, through: :deals, source: :to
  has_many :blocked, through: :reverse_of_deals, source: :from

  # 通報をした、されたの関係
  has_many :reports, class_name: "Report", foreign_key: "from_id", dependent: :destroy
  has_many :reverse_of_reports, class_name: "Report", foreign_key: "to_id", dependent: :destroy

  # 一覧画面で使う
  has_many :reportings, through: :reports, source: :to
  has_many :reported, through: :reverse_of_reports, source: :from

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

  # ブロックしたときの処理
  def block(user_id)
    deals.create(to_id: user_id)
  end
  # ブロックを外すときの処理
  def unblock(user_id)
    deals.find_by(to_id: user_id).destroy
  end
  # ブロックしているか判定
  def blocking?(user)
    blockings.include?(user)
  end

  # 通報したときの処理
  def report(user_id)
    reports.create(to_id: user_id)
  end
  # 通報を外すときの処理
  def unreport(user_id)
    reports.find_by(to_id: user_id).destroy
  end
  # 通報しているか判定
  def reporting?(user)
    reportings.include?(user)
  end

  validates :name,
    length: { maximum: 12, allow_blank: true }
  validates :email,
    presence: true,
    format: { with: /\A[a-z]{1,2}[0-9]{6}(@senshu-u.jp)\z/, allow_blank: true },
    uniqueness: { case_sensitive: false }
  validates :password,
    length: { minimum: 8, maximum: 15, allow_blank: true }
  validates_acceptance_of :agreement, allow_nil: false, on: :create
end
