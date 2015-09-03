# トレーナーとトレーニーのペア
class Pair < ActiveRecord::Base
  validates :trainee_id, uniqueness: true
end
