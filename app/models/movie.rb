class Movie < ApplicationRecord
  has_many :lists, through: :bookmarks
  has_many :bookmarks, dependent: :destroy
  has_one_attached :photo

  validates :title, presence: true, uniqueness: true
  validates :overview, presence: true

  # def poster
  #   content_type = RestClient.get(poster_url).headers[:content_type]
  #   default_url = "https://source.unsplash.com/featured/movies?id=#{rand(100000)}"

  #   content_type == 'image/jpeg' ? poster_url : default_url
  # end
end
