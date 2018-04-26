# == Schema Information
#
# Table name: artists
#
#  id         :integer          not null, primary key
#  name       :string
#  image_url  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Artist < ApplicationRecord
	has_many :albums, dependent: :destroy
end
