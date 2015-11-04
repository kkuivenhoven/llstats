class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  attr_accessor :login #this method makes a getter and a setter

  validates :username, presence: true, length: {maximum: 255}, uniqueness: { case_sensitive: false }, format: { with: /\A[a-zA-Z0-9]*\z/, message: "may only contain letters and numbers." } #creates validators for the username 

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def self.find_first_by_auth_conditions(warden_conditions)
	conditions = warden_conditions.dup
    if login = conditions.delete(:login)
       where(conditions).where(["username = :value OR lower(email) = lo    wer(:value)", { :value => login }]).first
	else
       where(conditions).first
	end
  end

end
