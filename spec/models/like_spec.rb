require 'rails_helper'

RSpec.describe Like, type: :model do
  user = User.new(name: 'Test User', posts_counter: 0)
  post = Post.new(user:, title: 'Hello', comments_counter: 0, likes_counter: 0)
  like = Like.new(user:, post:)
  subject { like }

  before { subject.save }

  context 'Call increment counter on a like' do
    it 'should increment the likes_counter of the Post' do
      previous_counter = post.likes_counter || 0
      like.increment_counter
      expect(post.likes_counter).to eql(previous_counter + 1)
    end
  end
end
