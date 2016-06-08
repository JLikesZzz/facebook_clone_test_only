module LikesHelper
  def total_likes
    Like.count
  end
end
