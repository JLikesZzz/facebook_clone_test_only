class Status < ActiveRecord::Base
  belongs_to :user
  has_many :likes, dependent: :destroy
  validates :title, :content, presence: true
  validates :content, :length => { :minimum => 10, message: "content is too short" }
  validates :title, :length => { :minimum => 8, message: "title is too short" }


  default_scope { order(created_at: :desc) }
end
