# ユーザーアカウント
# トレーナーもトレーニーもこれ。
class Account < ActiveRecord::Base
  self.inheritance_column = :inheritance

  enum type: %i( trainer trainee )

  validates :email, uniqueness: true

  # トレー二ーの場合、
  # Pairを通して
  # トレーナーアカウントを一つだけもつ
  has_one :account,
          -> { where type: :trainer },
          through: :pair,
          primary_key: :trainee_id
  # トレーナーの場合、
  # Pairを通して
  # トレーナーアカウントを一つだけもつ
  has_many :accounts,
           -> { where type: :trainee },
           through: :pair,
           primary_key: :trainer_id
end
