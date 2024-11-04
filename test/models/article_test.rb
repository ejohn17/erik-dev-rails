require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
    def setup
        @article = Article.new(title: "Example Title", description: "Example Description")
    end

    test "article should be valid" do
        assert @article.valid?
    end

    test "title should be present" do
        @article.title = " "
        assert_not @article.valid?
    end

    test "title should be at least 3 characters" do
        @article.title = "aa"
        assert_not @article.valid?
    end 

    test "title should be at most 50 characters" do
        @article.title = "a" * 51
        assert_not @article.valid?
    end

    test "description should be present" do
        @article.description = " "
        assert_not @article.valid?
    end

    test "description should be at least 10 characters" do
        @article.description = "a" * 9
        assert_not @article.valid?
    end

    test "description should be at most 300 characters" do
        @article.description = "a" * 301
        assert_not @article.valid?
    end
end
