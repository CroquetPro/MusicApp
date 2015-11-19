# == Schema Information
#
# Table name: albums
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  band_id    :integer          not null
#  atype      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Album < ActiveRecord::Base
  ALBUM_TYPE = %w(Live Studio)

  validates :name, :band_id, presence: true
  validates :atype, presence: true, inclusion: { in: ALBUM_TYPE }

  belongs_to :band,
    foreign_key: :band_id,
    primary_key: :id,
    class_name: "Band"

  has_many :tracks, dependent: :destroy,
    foreign_key: :album_id,
    primary_key: :id,
    class_name: "Track"

end
