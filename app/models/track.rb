# == Schema Information
#
# Table name: tracks
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  album_id   :integer          not null
#  ttype      :string           not null
#  lyrics     :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Track < ActiveRecord::Base
  TRACK_TYPE = %w(Regular Bonus)

  validates :title, :album_id, presence: true
  validates :ttype, presence: true, inclusion: { in TRACK_TYPE }

  belongs_to :album,
    foreign_key: :album_id,
    primary_key: :id,
    class_name: "Album"

  belongs_to :band,
    through: :album,
    source: :band

end
