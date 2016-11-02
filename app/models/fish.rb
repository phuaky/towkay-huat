class Fish < ApplicationRecord
  belongs_to :stall
  has_many :recorded_trades
  has_many :all_seafood_stocks, through: :stalls

  validates :english,
  presence: true

  validates :image,
  presence: true
end
