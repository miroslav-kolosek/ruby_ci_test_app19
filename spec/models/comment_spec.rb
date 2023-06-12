require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe "Attributes" do
    it { should have_db_column(:commenter).of_type(:string) }
    it { should have_db_column(:body).of_type(:text) }
    it { should have_db_column(:status).of_type(:string) }
  end

  describe "Associations" do
    it { should belong_to(:article) }
  end
end