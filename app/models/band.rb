# == Schema Information
#
# Table name: band
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Band < ActiveRecord::Base
  validates :name, presence: true

  has_many :albums, dependent: :destroy,
    foreign_key: :band_id,
    primary_key: :id,
    class_name: "Album"

  has_many :tracks,
    through: :albums,
    source: :tracks
end
