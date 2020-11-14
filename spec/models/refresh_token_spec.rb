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
require 'rails_helper'

RSpec.describe RefreshToken, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to :user }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of :token }
    it { is_expected.to validate_presence_of :user }

    describe '#validates_uniqueness_of :title' do
      subject { build :refresh_token, user_id: user.id }

      let(:user) { create :user }

      it { is_expected.to validate_uniqueness_of :token }
    end
  end
end
