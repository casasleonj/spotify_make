# == Schema Information
#
# Table name: songs
#
#  id          :integer          not null, primary key
#  name        :string
#  number      :integer
#  preview_url :string
#  album_id    :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Song < ApplicationRecord
  belongs_to :album
end
