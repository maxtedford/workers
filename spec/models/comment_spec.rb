require 'spec_helper'

describe Comment do
  before(:each) do
    @article = Article.create(:title => "Hello, World", 
                              :body => "Sample Body.")
    @comment = @article.comments.create(:author_name => "Daffy Duck",
                                        :body => "My comment goes here.")
  end

  it "should be valid with valid attributes" do
    @article.should be_valid
    @comment.should be_valid
  end

  it "should respond to article" do
    @comment.should respond_to(:article)
  end

  it "must have a value in article_id" do
    @comment.article_id = nil
    @comment.should_not be_valid
  end

  context ".for_dashboard" do
    it "gives the most recent 5 comments" do
      6.times do
        Fabricate(:comment)
      end
      expected = Comment.order('created_at DESC').limit(5).all

      comments = Comment.for_dashboard
      comments.count.should eq(5)
      comments.should eq(expected)
    end
  end
end
