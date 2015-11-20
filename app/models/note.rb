# == Schema Information
#
# Table name: notes
#
#  id         :integer          not null, primary key
#  text       :string           not null
#  track_id   :integer          not null
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Note < ActiveRecord::Base
  validates :text, presence: true

  belongs_to :commenter,
    foreign_key: :user_id,
    primary_key: :id,
    class_name: "User"

  belongs_to :track,
    foreign_key: :track_id,
    primary_key: :id,
    class_name: "Track"

end
