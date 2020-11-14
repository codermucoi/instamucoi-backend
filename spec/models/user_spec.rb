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
require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'has secure password' do
    it { is_expected.to have_secure_password }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of :email }
    it { is_expected.to validate_uniqueness_of :email }
    it { is_expected.to allow_values('thecodedevils@gmail.com').for :email }
    it { is_expected.not_to allow_values('@').for :email }
    it { is_expected.to validate_confirmation_of :password }
    it { is_expected.to validate_length_of(:password).is_at_most ActiveModel::SecurePassword::MAX_PASSWORD_LENGTH_ALLOWED }
    it { is_expected.to validate_presence_of :password_confirmation }
  end
end
