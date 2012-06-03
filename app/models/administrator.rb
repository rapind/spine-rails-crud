class Administrator < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :encryptable, :confirmable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,
         :validatable, :token_authenticatable, :lockable

  # Mass assignment protection
  attr_accessible :email, :password, :password_confirmation, :remember_me
end
