require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it "nicknameとemailとpasswordとpassword_confirmationとfirst_nameとlast_nameとfirst_name_subとlast_name_subとbirthdayが存在すれば登録できる" do
        expect(@user).to be_valid
      end
    end

    context '新規登録できない場合' do
    
      it 'nicknameが空では登録できない' do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'emailが空では登録できない' do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
  
      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end

      it 'emailは@を含まないと登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
    
      it 'passwordが空では登録できない' do
        @user.password = ""
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'passwordが5文字以下では登録できない' do
        @user.password = "aaa11"
        @user.password_confirmation = "aaa11"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end

      it 'passwordが129文字以上では登録できない' do
        @user.password = Faker::Internet.password(min_length: 129, max_length: 150)
        @user.password_confirmation =  @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too long (maximum is 128 characters)")
      end

      it 'passwordが半角英数字混合でなければ登録できない' do
        @user.password = "aaaaaa"
        @user.password_confirmation = "aaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end

      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'first_nameが半角英字では登録できない' do
        @user.first_name = "ab"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end

      it 'first_nameが半角数字では登録できない' do
        @user.first_name = "12"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end

      it 'first_nameが半角英数字では登録できない' do
        @user.first_name = "ab12"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end

      it 'last_nameが半角英字では登録できない' do
        @user.last_name = "ab"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid")
      end

      it 'last_nameが半角数字では登録できない' do
        @user.last_name = "12"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid")
      end

      it 'last_nameが半角英数字では登録できない' do
        @user.last_name = "ab12"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid")
      end

      it 'first_name_subが漢字では登録できない' do
        @user.first_name_sub = "横山"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name sub is invalid")
      end

      it 'first_name_subがひらがなでは登録できない' do
        @user.first_name_sub = "よこやま"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name sub is invalid")
      end

      it 'first_name_subが半角英字では登録できない' do
        @user.first_name_sub = "12"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name sub is invalid")
      end

      it 'first_name_subが半角数字では登録できない' do
        @user.first_name_sub = "ab"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name sub is invalid")
      end

      it 'first_name_subが半角英数字では登録できない' do
        @user.first_name_sub = "ab12"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name sub is invalid")
      end

      it 'last_name_subが漢字では登録できない' do
        @user.last_name_sub = "文哉"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name sub is invalid")
      end

      it 'last_name_subがひらがなでは登録できない' do
        @user.last_name_sub = "ふみや"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name sub is invalid")
      end

      it 'last_name_subが半角英字では登録できない' do
        @user.last_name_sub = "ab"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name sub is invalid")
      end

      it 'last_name_subが半角数字では登録できない' do
        @user.last_name_sub = "12"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name sub is invalid")
      end

      it 'last_name_subが半角英数字では登録できない' do
        @user.last_name_sub = "ab12"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name sub is invalid")
      end

      it 'birthdayが空では登録できない' do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end

    end

  end

end
