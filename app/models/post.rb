class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :likes, class_name: 'Like', foreign_key: 'post_id'
  has_many :comments, class_name: 'Comment', foreign_key: 'post_id'

  after_save :update_posts_counter

  def recent_comments
    comments.last(5)
  end

  def update_posts_counter
    author.increment!(:posts_counter)
  end
end
