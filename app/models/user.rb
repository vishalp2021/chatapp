class User < ApplicationRecord
	validates_uniqueness_of :username #for unique username
  scope :all_except, ->(user) { where.not(id: user) } #to hide current_user in user list so user can't chat with himself
  after_create_commit { broadcast_append_to "users" }
end
 