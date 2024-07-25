class User < ApplicationRecord

  has_many :sessions
  has_many :tasks

  validates :username, presence: true, length: { minimum: 3, maximum: 64 }
  validates :password, presence: true, length: { minimum: 8, maximum: 64 }
  
  before_create :hash_password
  validates_uniqueness_of :username

  private

  def hash_password
    self.password = BCrypt::Password.create(self.password)
  end
end
