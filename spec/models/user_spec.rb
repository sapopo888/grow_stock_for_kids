require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'バリデーションチェック' do
    it '設定したすべてのバリデーションが機能しているか' do
      user = User.new(name: "ユーザー", status: 0, email: "user@example.com", password: "password", password_confirmation: "password")
      expect(user).to be_valid
      expect(user.errors).to be_empty
    end

    it 'nameが空の時にバリデーションが通らない' do
      user = User.new(name: "", status: 0, email: "user@example.com", password: "password", password_confirmation: "password")
      expect(user).to be_invalid
      expect(user.errors).not_to be_empty
    end

    it 'statusが空の時にバリデーションが通らない' do
      user = User.new(name: "ユーザー", status: nil, email: "user@example.com", password: "password", password_confirmation: "password")
      expect(user).to be_invalid
      expect(user.errors).not_to be_empty
    end
  end
end
