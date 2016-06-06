class Status < ActiveRecord::Base
  belongs_to :user
  has_many :likes, dependent: :destroy
  validates :user_id, :title, :content, presence: true
  validates :content, :length => { :minimum => 10, message: "content is too short" }
  validates :title, :length => { :minimum => 8, message: "title is too short" }



end
