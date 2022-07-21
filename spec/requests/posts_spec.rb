require "rails_helper"

RSpec.describe "Posts", type: :request do
  describe "GET #index" do
    before(:example) { get user_posts_path(1) } # get(:index)

    it "is a success" do
      expect(response).to have_http_status(:ok)
    end

    it "renders 'index' template" do
      expect(response).to render_template("index")
    end

    it "response body includes correct placeholder text" do
      expect(response.body.include?("You are in posts/index")).to be_truthy
    end
  end

  describe "GET #show" do
    before(:example) { get user_post_path(1, 2) } # get(:show)

    it "is a success" do
      expect(response).to have_http_status(:ok)
    end

    it "renders 'show' template" do
      expect(response).to render_template("show")
    end

    it "response body includes correct placeholder text" do
      expect(response.body.include?("You are in posts/show")).to be_truthy
    end
  end
end
