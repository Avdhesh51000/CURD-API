class User < ApplicationRecord
 	 has_secure_password
   	 has_many :friendships, dependent: :destroy
	 has_many :friends ,-> { where(friendships: {status: 'accepted'})} , :through => :friendships 
	 has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
 	 has_many :inverse_friends,-> { where(friendships: {status: 'accepted'})}, :through => :inverse_friendships, :source => :user
 	 has_many :pending_request,-> { where(friendships: {status: 'pending'})}, :through => :inverse_friendships, :source => :user

 	 validates :name, presence: true, length: { minimum: 5 , maximum: 20 }, allow_blank: true, on: :create
 	 validates_format_of :name, :with => /[A-Za-z]+/ ,  on: :create
	 validates :email, presence: true 
	 validates :email, uniqueness: true, on: :create 
	 validates_format_of :email, :with =>/\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/, message: "must be a abc123@abc.com" ,on: :create 
	 validates :password, presence: true, length: { minimum: 5 , maximum: 18 }

	 #before_validation :cannot_add_self

  


	def accept(user_id)
		@b=Friendship.find_by(user_id: user_id, friend_id: id)
		if @b.status=="pending"|| @b.status=="reject"
			@b.update_attribute :status, "accepted"

		end
	end
	def reject(user_id)
		debugger
		@b=Friendship.find_by(user_id: user_id, friend_id: id)
		if @b.status=="pending"
			@b.update_attribute :status, "reject"
		end
	end

	def mutualfriends	
		if User.find(id).friends.any? || User.find(id).inverse_friends.any?
			a=User.find(id).friends	
			#options.reverse_merge!(defaults)
			b=User.find(id).inverse_friends
		else
			a=errors.add(:id, "No mutual friends found")
		end
		return a,b
	end

	def sendfriendrequest(user_id)	
		a=Friendship.find_by(user_id: user_id, friend_id: id)||Friendship.find_by(user_id: id, friend_id: user_id)
		if id == user_id
			errors.add(:id, 'You cannot add yourself as a friend.')
		elsif	a.blank?
			User.find(id).friendships.create(user_id: id, friend_id: user_id, status: "pending")
		elsif a.status=="pending"
			errors.add(:id, "You already have request See the status")
		elsif  a.status=="accepted"
			errors.add(:id, "You were already a friend")
		else
			errors.add(:id, "You were Blocked by user & can't send friend request")
		end
		
	end

  # def cannot_add_self(user_id)
  # 	debugger
  #   errors.add(:id, 'You cannot add yourself as a friend.') if id == user_id
  # end


end
