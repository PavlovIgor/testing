class App < ApplicationRecord
	has_many :pages
	belongs_to :user

	validates :name, presence: true
	validates :url, presence: true
end