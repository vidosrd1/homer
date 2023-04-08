class Movie < ApplicationRecord
  has_rich_text :body
  has_one_attached :poster      # 画像
  has_one_attached :title_song  # 音声
  has_one_attached :trailer
  has_many_attached :images

  def images_as_thumbnails
    images.map do |image|
      image.variant(resize_to_limit: [150, 150]).processed
    end
  end

  def images_as_thumbnails(movie)
    movie.variant(resize_to_limit: [200, 200]).processed
  end
end
