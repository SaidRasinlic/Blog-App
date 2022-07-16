require 'rails_helper'

RSpec.describe Comment, type: :model do
  user = User.new(name: 'Test User', posts_counter: 0)
  post = Post.new(user:, title: 'Hello', comments_counter: 0, likes_counter: 0)
  comment = Comment.new(user:, post:)
  subject { comment }

  before { subject.save }

  context 'Call increment counter on a comment' do
    it 'should increment the comments_counter of the Post' do
      previous_counter = post.comments_counter || 0
      comment.update_counter
      expect(post.comments_counter).to eql(previous_counter + 1)
    end
  end
end
