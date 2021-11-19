class Conversation < ActiveRecord::Base
  belogs_to :sender, foreign_key: :sender_id, class_name: 'User'
  belogs_to :receiver, foreign_key: :receiver_id, class_name: 'User'

  has_many :messages, dependent: :destroy
  validates_uniqueness_of :sender_id, scope: :receiver

  scope :between, -> (sender_id, receiver_id) do
    where("converssation.sender_id = ? AND conversations.receiver_id = ?").or(where("conversations.sender_id = ? AND conversations.receiver_id = ?"),
    sender_id, receiver_id, receiver_id, sender_id)
  end
end
