FactoryBot.define do
  factory :room do
    discribe {Faker::Lorem.sentence}
    address {"大阪府堺市"}
    station {"大阪駅"}
    price  {100000}
    date {"10月まで"}
    pet_id {2}
    air_conditioner_id {2}
    toilet_id {2}
    bathroom_id {2}
    kitchen_id {2}
    phone_number {"09098764456"}
    mail {"soccer@.jp"}
    rent {"1"}
  
           
    association :user 

    after(:build) do |room|
      room.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end

  end
end