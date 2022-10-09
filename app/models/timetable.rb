class Timetable < ApplicationRecord
  belongs_to :user

  mount_uploader :timetable_img, TimetableUploader
end
