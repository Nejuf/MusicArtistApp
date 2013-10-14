
class User < ActiveRecord::Base

	attr_accessible :email, :password, :session_token
	validates :email, presence: true
	validates :session_token, presence: true
	validates :password_digest, presence: true

	 after_initialize :ensure_session_token

	def password=(pass)
		self.password_digest = BCrypt::Password.create(pass).to_s
	end

	def is_password?(pass)
		BCrypt::Password.new(password_digest).is_password?(pass)
	end

	def self.generate_session_token
		SecureRandom.urlsafe_base64(16)
	end

	def reset_session_token
		self.session_token = self.class.generate_session_token
		self.save!
		self.session_token
	end

	def self.find_by_credentials(email, pass)
		u = User.find_by(email: email)
		return nil if u.nil? || !u.is_password?(pass)
		u
	end

	private
	def ensure_session_token
		self.session_token ||= self.class.generate_session_token
	end
end