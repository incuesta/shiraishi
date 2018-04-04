class Video < ApplicationRecord
	acts_as_list

	validates :video_id, presence: true
	validates :host, presence: true
	validates :title, presence: true
	validates :description, presence: true
	validates :tags, presence: true
end
