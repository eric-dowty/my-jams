class Song < ActiveRecord::Base
  validates :title, :artist, presence: true
  # def to_param
  #   title
  # end

end