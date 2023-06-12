FactoryBot.define do
  factory :comment, class: Comment do
    sequence(:commenter) { |n| "User #{n}"}
    sequence(:body) { |n| "Comment #{n}"}
    association :article

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