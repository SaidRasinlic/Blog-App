require 'rails_helper'

RSpec.describe User, type: :model do
  before(:all) do
    @user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
  end

  it 'name should be present' do
    @user.name = nil
    expect(@user).not_to be_valid
  end

  it 'name should not be blank' do
    @user.name = '   '
    expect(@user).not_to be_valid
  end

  it 'name should be string' do
    @user.name = 1
    expect(@user).not_to be_valid
  end

  it 'photo should be string' do
    @user.photo = 1
    expect(@user).not_to be_valid
  end

  it 'posts_counter should be integer' do
    @user.posts_counter = 'a'
    expect(@user).not_to be_valid
  end

  it 'posts_counter should be greater than or equal to 0' do
    @user.posts_counter = -1
    expect(@user).not_to be_valid
  end

  it 'posts_counter is be greater than or eq to zero' do
    @user.posts_counter = 2
    expect(@user).to be_valid
  end

  it 'posts_counter should return less than 3 posts' do
    expect(@user.posts_counter).to be < 3
  end
end
