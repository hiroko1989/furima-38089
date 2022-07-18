require 'rails_helper'

 RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

 describe "ユーザー新規登録" do
   it "nicknameが空だと登録できない" do
    @user.nickname = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("Nickname can't be blank")
   end
    
   it "emailが空では登録できない" do
    @user.email = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("Email can't be blank")
   end

   it 'passwordが空では登録できない' do
    @user.password = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("Password can't be blank")
  end
   
  it 'passwordとpassword_confirmationが不一致では登録できない' do
    @user.password = '123456'
    @user.password_confirmation = '1234567'
    @user.valid?
    expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
  end

  it 'passwordが6文字以上でないと登録できない' do
    @user.password = 'aaaaa'
    @user.password_confirmation = 'aaaaa'
    @user.valid?
    expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
  end

  it 'passwordは英字のみでは登録できない' do
    @user.password = 'aaaaaa'
    @user.password_confirmation = 'aaaaaa'
    @user.valid?
    expect(@user.errors.full_messages).to include('Password 半角の英字と数字の両方を含めて設定してください')
  end

  it 'passwordは数字のみでは登録できない' do
    @user.password = '666666'
    @user.password_confirmation = '666666'
    @user.valid?
    expect(@user.errors.full_messages).to include('Password 半角の英字と数字の両方を含めて設定してください')
  end

  it 'passwordは全角文字では登録できない' do
    @user.password = 'AAAAAA'
    @user.password_confirmation = 'AAAAAA'
    @user.valid?
    expect(@user.errors.full_messages).to include('Password 半角の英字と数字の両方を含めて設定してください')
  end


  it '重複したemailが存在する場合は登録できない' do
    @user.save
    another_user = FactoryBot.build(:user)
    another_user.email = @user.email
    another_user.valid?
    expect(another_user.errors.full_messages).to include('Email has already been taken')
  end

  it 'emailは@を含まないと登録できない' do
    @user.email = 'testmail'
    @user.valid?
    expect(@user.errors.full_messages).to include('Email is invalid')
  end

  it 'first_nameは、空では登録できない' do
    @user.first_name = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("First name can't be blank")
  end

  it 'family_nameは、空では登録できない' do
    @user.family_name = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("Family name can't be blank")
  end

  it 'ruby_first_nameは、空では登録できない' do
    @user.ruby_first_name = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("Ruby first name can't be blank")
  end

  it 'ruby_family_nameは、空では登録できない' do
    @user.ruby_family_name = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("Ruby family name can't be blank")
  end

  it 'birth_dateは、空では登録できない' do
    @user.birth_date = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("Birth date can't be blank")
  end

  it 'first_nameは、全角（漢字・ひらがな・カタカナ）でないと登録できない' do
    @user.first_name = 'yamada'
    @user.valid?
    expect(@user.errors.full_messages).to include("First name 全角（漢字・ひらがな・カタカナ）で入力してください")
  end

  it 'family_nameは、全角（漢字・ひらがな・カタカナ）でないと登録できない' do
    @user.family_name = 'hanako'
    @user.valid?
    expect(@user.errors.full_messages).to include("Family name 全角（漢字・ひらがな・カタカナ）で入力してください")
  end

  it 'ruby_first_nameは、全角カタカナでないと登録できない' do
    @user.ruby_first_name = 'やまだ'
    @user.valid?
    expect(@user.errors.full_messages).to include("Ruby first name 全角カタカナで入力してください")
  end

  it 'ruby_family_nameは、全角カタカナでないと登録できない' do
    @user.ruby_family_name = 'はなこ'
    @user.valid?
    expect(@user.errors.full_messages).to include("Ruby family name 全角カタカナで入力してください")
  end
 end
end