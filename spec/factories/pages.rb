FactoryGirl.define do
  factory :page do
    name "MyString"
    title "MyString"
    body "MyText"
    updated_on "2016-05-03"
    parent_id 1
    position 1
  end
end
