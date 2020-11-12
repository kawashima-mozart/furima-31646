require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end

    context "新規登録ができるとき" do
      it"すべての値が正しく入力されていれば登録できる" do
        expect(@user).to be_valid
      end

    end

    context "新規登録できないとき" do
      it 'ニックネームがないとき' do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank") 
      end
      it 'メールアドレスがないとき' do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank") 
      end
      it 'メールアドレスが一意性でないとき' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken") 
      end
      it 'メールアドレスが、@を含まないとき' do
        @user.email = "testmail.com"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid") 
      end
      it 'パスワードがないとき' do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank") 
      end
      it 'パスワードが、５文字以下だったとき' do
        @user.password = "test1"
        @user.password_confirmation ="test1"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)") 
      end
      it 'パスワードが、半角英語だけであるとき' do
        @user.password = "testtest"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password") 
      end
      it 'パスワードは、半角数字だけのとき' do
        @user.password = "000000"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password") 
      end
      it 'パスワードの確認用が空欄のとき' do
        @user.password_confirmation  = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation can't be blank") 
      end
      it 'パスワードは、確認用と一致しないとき' do
        @user.password_confirmation  = "test222"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password") 
      end
      it '名字が空欄のとき' do
        @user.last_name_chn = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name chn can't be blank") 
      end
      it '名前が空欄のとき' do
        @user.first_name_chn = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First name chn can't be blank") 
      end
      it '名字と名前が半角英語のとき' do
        @user.last_name_chn = "test"
        @user.first_name_chn = "test"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name chn is invalid.全角（漢字・ひらがな・カタカナ）で入力してください","First name chn is invalid.全角（漢字・ひらがな・カタカナ）で入力してください") 
      end
      it '名字と名前が半角数字のとき' do
        @user.last_name_chn = "111"
        @user.first_name_chn = "111"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name chn is invalid.全角（漢字・ひらがな・カタカナ）で入力してください","First name chn is invalid.全角（漢字・ひらがな・カタカナ）で入力してください") 
      end
      it '名字と名前が全角数字のときでの入力であること' do
        @user.last_name_chn = "１１１"
        @user.first_name_chn = "１１１"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name chn is invalid.全角（漢字・ひらがな・カタカナ）で入力してください","First name chn is invalid.全角（漢字・ひらがな・カタカナ）で入力してください") 
      end
      it 'フリガナで、名字が空欄のとき' do
        @user.last_name_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank") 
      end
      it 'フリガナで、名前が空欄のとき' do
        @user.first_name_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank") 
      end
      it 'フリガナが、半角英語のとき' do
        @user.last_name_kana = "test"
        @user.first_name_kana = "test"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana is invalid.全角（カタカナ）で入力してください", "First name kana is invalid.全角（カタカナ）で入力してください") 
      end
      it 'フリガナが、半角数字のとき' do
        @user.last_name_kana = "111"
        @user.first_name_kana = "111"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana is invalid.全角（カタカナ）で入力してください","First name kana is invalid.全角（カタカナ）で入力してください") 
      end
      it 'フリガナが、全角数字のとき' do
        @user.last_name_kana = "１１１"
        @user.first_name_kana = "１１１"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana is invalid.全角（カタカナ）で入力してください","First name kana is invalid.全角（カタカナ）で入力してください") 
      end
      it 'フリガナが、全角漢字のとき' do
        @user.last_name_kana = "亜衣兎"
        @user.first_name_kana = "亜衣兎"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana is invalid.全角（カタカナ）で入力してください","First name kana is invalid.全角（カタカナ）で入力してください") 
      end
      it 'フリガナが、全角ひらがなのとき' do
        @user.last_name_kana = "あああ"
        @user.first_name_kana = "あああ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana is invalid.全角（カタカナ）で入力してください","First name kana is invalid.全角（カタカナ）で入力してください") 
      end
      it '生年月日が空欄のとき' do
        @user.birthday = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank") 
      end
    end
  end
end
