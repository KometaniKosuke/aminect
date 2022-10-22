class Announce < ApplicationRecord
  belongs_to :user, optional: true
end
