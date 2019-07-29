class Movie < ApplicationRecord
  belongs_to :category
  has_many :reviews, dependent: :destroy
  has_many :movie_theaters, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  validates :category_id, presence: true
  has_attached_file :image
  validates_attachment :image,
                       content_type: { content_type: %r{\Aimage/.*\z} },
                       size: { less_than: 1.megabyte }
  validates :trailer, presence: true, format: { with: /^#{URI.regexp.to_s}$/, multiline: true }
end
