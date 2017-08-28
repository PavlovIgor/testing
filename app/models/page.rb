class Page < ApplicationRecord
	has_many :tests
	belongs_to :app

	validates :name, presence: true
	validates :url, presence: true
end