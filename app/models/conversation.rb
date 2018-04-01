class Conversation < ApplicationRecord
  belongs_to :client

  has_many :comments, dependent: :destroy

end
