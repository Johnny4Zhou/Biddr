class Bid < ApplicationRecord
  belongs_to :user
  belongs_to :auction
  validates :amount, presence: true, numericality: {greater_than: :auction_current_price}


  def auction_current_price
    auction.current_price
  end
end
