require 'rails_helper'

RSpec.describe Room, type: :model do

  before do
    @room = FactoryBot.build(:room)
  end

  describe '商品の保存' do
    context '商品が投稿できる場合' do
        it '必須項目が空でなければ登録できる' do
          expect(@room).to be_valid
        end
        it '電話番号が空でも登録できる' do
          @room.phone_number = ""
          expect(@room).to be_valid
        end
        it 'メールアドレスが空でも登録できる' do
          @room.mail = ""
          expect(@room).to be_valid
        end
     end

     context '部屋が投稿できない場合' do
      it '画像が空では投稿できない' do
        @room.image = nil
        @room.valid?
        expect(@room.errors.full_messages).to include("Image can't be blank")
      end  
      it '住所が空では投稿できない' do
        @room.address = ""
        @room.valid?
        expect(@room.errors.full_messages).to include("Address can't be blank")
      end 
      it '最寄駅が空では投稿できない' do
        @room.station = ''
        @room.valid?
        expect(@room.errors.full_messages).to include("Station can't be blank")
      end 
      it '利用可能日が空では投稿できない' do
        @room.date = ''
        @room.valid?
        expect(@room.errors.full_messages).to include("Date can't be blank")
      end 
      it '説明文が空では投稿できない' do
        @room.discribe = ''
        @room.valid?
        expect(@room.errors.full_messages).to include("Discribe can't be blank")
      end 
      it '価格が空では投稿できない' do
        @room.price = ''
        @room.valid?
        expect(@room.errors.full_messages).to include("Price can't be blank")
      end 
      it 'エアコンが空では投稿できない' do
        @room.air_conditioner_id = 1
        @room.valid?
        expect(@room.errors.full_messages).to include("Air conditioner must be other than 1")
      end  
      it 'キッチンが空では投稿できない' do
        @room.kitchen_id = 1
        @room.valid?
        expect(@room.errors.full_messages).to include("Kitchen must be other than 1")
      end 
      it 'トイレが空では投稿できない' do
        @room.toilet_id = 1
        @room.valid?
        expect(@room.errors.full_messages).to include("Toilet must be other than 1")
      end 
      it 'お風呂が空では投稿できない' do
        @room.bathroom_id = 1
        @room.valid?
        expect(@room.errors.full_messages).to include("Bathroom must be other than 1")
      end  
      it 'ペットが空では投稿できない' do
        @room.pet_id = 1
        @room.valid?
        expect(@room.errors.full_messages).to include("Pet must be other than 1")
      end
      it '電話番号が入力された時、ハイフンを含んでいれば保存できないこと' do
        @room.phone_number = '090-3456-3456'
        @room.valid?
        expect(@room.errors.full_messages).to include("Phone number is invalid. without hyphen(-)") 
      end
      it '電話番号が入力された時、英数混合では保存できないこと' do
        @room.phone_number = '09009ahsgrj'
        @room.valid?
        expect(@room.errors.full_messages).to include("Phone number is invalid. without hyphen(-)")
      end
      it '価格が全角数字では投稿できない' do
        @room.price = '２４４５'
        @room.valid?
        expect(@room.errors.full_messages).to include("Price is not a number")
      end 
      it '価格が全角文字では投稿できない' do
        @room.price = '文字'
        @room.valid?
        expect(@room.errors.full_messages).to include("Price is not a number")
      end 
      it '半角英混合では投稿できない' do
        @room.price = '1234acb'
        @room.valid?
        expect(@room.errors.full_messages).to include("Price is not a number")
      end 
      it '半角英語では投稿できない' do
        @room.price = 'acb'
        @room.valid?
        expect(@room.errors.full_messages).to include("Price is not a number")
      end 
      it '価格が1000以下では投稿できない' do
        @room.price = 7
        @room.valid?
        expect(@room.errors.full_messages).to include("Price must be greater than 999")
      end 
      it '価格が10000000以上では投稿できない' do
        @room.price = 10000000000
        @room.valid?
        expect(@room.errors.full_messages).to include("Price must be less than 1000001")
      end 
     end
  end
end
