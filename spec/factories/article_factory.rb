FactoryBot.define do
  factory :article do
    sequence(:title) { |n| "Article Title #{n}"}
    sequence(:body) { |n| "Article body #{n}"}

    trait(:public) do
      status { 'public' }
    end

    trait(:archived) do
      status { 'archived' }
    end

    trait(:private) do
      status { 'private' }
    end
  end
end