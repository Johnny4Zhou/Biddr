class Auction < ApplicationRecord
  belongs_to :user
  has_many :bids
  validates :title, presence: true
  validates :end_date, presence: true
  validates :reserve_price, presence: true

  include AASM
  aasm do
  state :draft, initial: true
  state :published
  state :cancelled
  state :won
  state :reserve_not_met
  state :reserve_met

    event :publish do
      transitions from: :draft, to: :published
    end

    event :win do
      transitions from: :published, to: :won
    end

    event :cancel do
      transitions from: [:draft, :published, :won], to: :cancelled
    end

    event :meet_reserve do
      transitions from: :published, to: :reserve_met
    end
  end
end
