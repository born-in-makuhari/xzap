# トレーナー
class Trainer < ActiveRecord::Base
  has_many :trainees, through: :pair
end
