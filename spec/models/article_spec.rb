require "rails_helper"

RSpec.describe Article, type: :model do
  describe "Attributes" do
    it { should have_db_column(:title).of_type(:string) }
    it { should have_db_column(:body).of_type(:text) }
    it { should have_db_column(:status).of_type(:string) }
  end

  describe "Associations" do
    it { should have_many(:comments).dependent(:destroy) }
  end

  describe "Methods" do
    describe "#public_count" do
      let!(:article_1) { Article.create!(title: "Article 1", body: "article 1111111", status: "public") }
      let!(:article_2) { Article.create!(title: "Article 2", body: "article 22222222", status: "private") }

      it do
        expect(Article.public_count).to eq 1
      end
    end

    describe "#search" do
      context "when article count is 1" do
        let!(:article_1) { Article.create!(title: "Article 1", body: "article 1111111", status: "public") }
        let!(:article_2) { Article.create!(title: "Article 2", body: "article 22222222", status: "private") }
        let!(:article_3) { Article.create!(title: "Ruby On Rails", body: "article 33333333333333", status: "private") }

        it do
          expect(Article.search('Rails').count).to eq 1
        end
      end

      context "when article count is 2" do
        let!(:article_1) { Article.create!(title: "Article 1", body: "article 1111111", status: "public") }
        let!(:article_2) { Article.create!(title: "Ruby On Rails 1", body: "article 22222222", status: "private") }
        let!(:article_3) { Article.create!(title: "Ruby On Rails 2", body: "article 33333333333333", status: "private") }

        it do
          expect(Article.search('Rails').count).to eq 2
        end
      end

      context "when article count is 3" do
        let!(:article_1) { Article.create!(title: "Ruby On Rails 1", body: "article 1111111", status: "public") }
        let!(:article_2) { Article.create!(title: "Ruby On Rails 2", body: "article 22222222", status: "private") }
        let!(:article_3) { Article.create!(title: "Ruby On Rails 3", body: "article 33333333333333", status: "private") }

        it do
          expect(Article.search('Rails').count).to eq 3
        end
      end
    end
  end
end
