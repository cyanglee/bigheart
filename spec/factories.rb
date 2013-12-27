FactoryGirl.define do
  factory :story_1, :class => Story do
    story_name 'test story 1'
    contact_email 'test email 1'
    appear_location 'test location 1'
    info_from 'test info 1'
    story_details 'test details 1'
  end

  factory :story_2, :class => Story do
    story_name 'test story 2'
    contact_email 'test email 2'
    appear_location 'test location 2'
    info_from 'test info 2'
    story_details 'test details 2'
  end

  factory :story_3, :class => Story do
    story_name 'test story 3'
    contact_email 'test email 2'
    appear_location 'test location 2'
    info_from 'test info 2'
    story_details 'test details 2'
  end
end