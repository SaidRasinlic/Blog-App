require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
             bio: 'Teacher from Mexico', posts_counter: 0)
  end

  before { subject.save }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'is valid without a photo' do
    subject.photo = nil
    expect(subject).to be_valid
  end

  it 'is valid without a bio' do
    subject.bio = nil
    expect(subject).to be_valid
  end

  it 'is not valid without a posts_counter' do
    subject.posts_counter = nil
    expect(subject).to_not be_valid
  end

  context 'Call recent posts on a user' do
    user = User.create(name: 'Test User', posts_counter: 0)
    Post.create(author: user, title: 'Hello', comments_counter: 0, likes_counter: 0)
    Post.create(author: user, title: 'Hello', comments_counter: 0, likes_counter: 0)
    Post.create(author: user, title: 'Hello', comments_counter: 0, likes_counter: 0)

    it 'should return the last 3 posts by that user' do
      recent_posts = user.recent_posts
      expect(recent_posts.length).to be(3)
    end
  end
end
