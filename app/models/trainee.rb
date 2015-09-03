# トレーニー
class Trainee < ActiveRecord::Base
  has_one :trainer, through: :pair
end
