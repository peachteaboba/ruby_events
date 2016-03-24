class Event < ActiveRecord::Base
  belongs_to :user
  has_many :joins, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :users, through: :joins, source: :user
  validates :name, presence: true, length: { in: 2..20 }
  validates :city, :state, :date, presence: true




  validate :date_cannot_be_in_the_past



  def date_cannot_be_in_the_past
    if date.present? && date < Date.today
      errors.add(:date, "can't be in the past")
    end
  end





end
