# == Schema Information
# Schema version: 20201114190919
#
# Table name: blacklisted_tokens
#
#  id         :bigint           not null, primary key
#  expire_at  :datetime         not null
#  token      :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_blacklisted_tokens_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_84eb108184  (user_id => users.id)
#
require 'rails_helper'

RSpec.describe BlacklistedToken, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to :user }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of :token }
    it { is_expected.to validate_presence_of :expire_at }
    it { is_expected.to validate_presence_of :user }
  end
end
