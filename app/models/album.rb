# == Schema Information
#
# Table name: albums
#
#  id          :integer          not null, primary key
#  name        :string
#  image_url   :string
#  released_at :date
#  artist_id   :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Album < ApplicationRecord
  belongs_to :artist

  has_many :songs, dependent: :destroy

  validates :name, :image_url, :released_at, presence: true
end
