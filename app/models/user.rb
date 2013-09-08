class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :token_authenticatable

  before_save :ensure_authentication_token

  validates :username, uniqueness: true
  validates :email, uniqueness: true

  def to_s
    username
  end

  # Allows an associated mobile app to confirm a valid user immediately
  def skip_confirmation!
    self.confirmed_at = Time.now
  end
end
