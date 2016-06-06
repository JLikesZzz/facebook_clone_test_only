class User < ActiveRecord::Base
  has_many :likes, dependent: :destroy
  has_many :statuses, dependent: :destroy

  validates :name, :email, presence: true, uniqueness: true
  validates :password, :password_confirmation, presence: true
  validates :password, :length => { :minimum => 6, :maximum => 20 }, :confirmation =>true
  validates :email, format: { with: /\A([\w+\-]\.?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/}
  validates_confirmation_of :password

end
