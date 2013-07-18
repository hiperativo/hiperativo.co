class User < ActiveRecord::Base
	ROLES = %w[leitor escritor editor admin]
	OPTIONS = User::ROLES.each_with_index.map{|r, i| [r.humanize, i]}
	devise :database_authenticatable, :trackable, :recoverable,
	:omniauthable, omniauth_providers: [:twitter]
	
	attr_accessible :name, :email, :password, :password_confirmation, :remember_me, 
	:provider, :uid, :token, :secret, :nickname, :bio, :image_url, :power, :role

	attr_accessor :role

	before_save :set_power

	def set_power
		if self.power.nil?
			self.power = 0 
		elsif self.power.class == "String"
			self.power = self.role 
		end
	end

	def role
		User::ROLES[self.power]
	end

	has_many :impulsos
	has_many :comentarios

end