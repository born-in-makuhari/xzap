# トレーナーとトレーニーのペア
class Pair < ActiveRecord::Base
  belongs_to :trainee
  belongs_to :trainer
end
