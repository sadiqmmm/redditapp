class Link < ActiveRecord::Base
	validates :title, presence: true
end
