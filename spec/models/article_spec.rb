require 'rails_helper'

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
      let!(:article_1) { Article.create!(title: 'Article 1', body: 'article 1111111', status: 'public') }
      let!(:article_2) { Article.create!(title: 'Article 2', body: 'article 22222222', status: 'private') }

      it do
        expect(Article.public_count).to eq 1
      end
    end
  end
end