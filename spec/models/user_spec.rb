require 'rails_helper'


RSpec.describe User, type: :model do

  describe 'Validations-' do
    # name validation
    context 'When user name presence' do 
      it 'should return true ' do
        user=User.new(name:"mayank yadav",email:'smple@gmail.com',password:"123456").save
        expect(user).to eq(true)
      end
    end
  
    context 'When user name not presence' do 
      it 'should return false ' do
        user=User.new(email:'smple@gmail.com',password:"123456").save
        expect(user).to eq(false)
      end

      it 'should return correct error message' do
        user=User.new(email:'smple@gmail.com',password:"123456")
        user.save
        expect(user.errors.full_messages).to match_array ["Name can't be blank"]
      end
    end

    #password validation
    context 'When user password presence' do 
      it 'should return true ' do
        user=User.new(name:"mayank yadav",email:'smple@gmail.com',password:"123456").save
        expect(user).to eq(true)
      end
    end
    context 'When user password is not presence' do 
      it 'should return false ' do
        user=User.new(name:"mayank yadav",email:'smple@gmail.com').save
        expect(user).to eq(false)
      end
    end

    #email validation
    context 'When user email is not presence' do 
      it 'should return false ' do
        user=User.new(name:"mayank yadav",password:"123456").save
        expect(user).to eq(false)
      end
    end

    context 'When user email is presence' do 
      it 'should return true ' do
        user=User.new(name:"mayank yadav",email:"jit@gmail.com",password:"123456").save
        expect(user).to eq(true)
      end
    end

    context "when email does'nt content @" do
      it 'should return false' do
        user=User.new(name:"mayank yadav",email:"jitgmailcom",password:"123456")
        user.save
        expect(user.errors.full_messages).to match_array ["Email is invalid"]
      end
    end

    #has_many validation

    it { should have_many(:reviews).dependent(:destroy) } 
    it { should have_many(:favorites).dependent(:destroy) } 
    it { should have_many(:favorite_movies) } 


  end
  
end
