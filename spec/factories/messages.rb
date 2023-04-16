FactoryBot.define do
  factory :message do
    content { "MyString" }
    user { nil }
    receiver { nil }
  end
end
