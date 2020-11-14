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
class User < ApplicationRecord
  api_guard_associations refresh_token: 'refresh_tokens', blacklisted_token: 'blacklisted_tokens'
  has_many :refresh_tokens, dependent: :delete_all
  has_many :blacklisted_tokens, dependent: :delete_all

  has_secure_password

  validates :email, presence: true,
                    uniqueness: { case_sensitive: true },
                    format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
  validates :password, confirmation: true, length: { maximum: ActiveModel::SecurePassword::MAX_PASSWORD_LENGTH_ALLOWED }
  validates :password_confirmation, presence: true
end
