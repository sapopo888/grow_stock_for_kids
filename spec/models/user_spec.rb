require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'バリデーションチェック' do
    it '設定したすべてのバリデーションが機能しているか' do
      user = build(:user) # FactoryBot.build(:user)と同じ
      expect(user).to be_valid
      expect(user.errors).to be_empty
    end

    it 'nameが空の時にバリデーションが通らない' do
      user = build(:user, name: "")
      expect(user).to be_invalid
      expect(user.errors).not_to be_empty
    end

    it 'statusが空の時にバリデーションが通らない' do
      user = build(:user, status: nil)
      expect(user).to be_invalid
      expect(user.errors).not_to be_empty
    end
  end
end
