# frozen_string_literal: true

# == Schema Information
# Schema version: 20201114182732
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  email           :string(255)      default(""), not null
#  name            :string(255)
#  password_digest :string(255)      default(""), not null
#  token_issued_at :datetime
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_users_on_email  (email) UNIQUE
#
FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    password { '123456' }
    password_confirmation { '123456' }
  end
end
