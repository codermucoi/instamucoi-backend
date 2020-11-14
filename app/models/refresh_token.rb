# frozen_string_literal: true

# == Schema Information
# Schema version: 20201114182732
#
# Table name: refresh_tokens
#
#  id         :bigint           not null, primary key
#  token      :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_refresh_tokens_on_token    (token) UNIQUE
#  index_refresh_tokens_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_279e9a0091  (user_id => users.id)
#
class RefreshToken < ApplicationRecord
  belongs_to :user

  validates :token, presence: true, uniqueness: { case_sensitive: true }
  validates :user, presence: true
end
