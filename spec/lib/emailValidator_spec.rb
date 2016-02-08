require 'spec_helper'
require 'emailValidator'

describe EmailValidator do

  let (:emailValidator) {EmailValidator.new()}

  describe '#isEmailValid?' do
    
    it 'should return false if there is no "."' do
      expect(emailValidator.isEmailValid?("taigir@gmail")).to be false
    end
    
    it 'should return false if there is no username' do
      expect(emailValidator.isEmailValid?("@gmail.com")).to be false
    end
        
    it 'should return false if there is no "@"' do
      expect(emailValidator.isEmailValid?("taigir.com")).to be false
    end

    it 'should return false if there is only one character "@"' do
      expect(emailValidator.isEmailValid?("@")).to be false
    end
    
    it 'should return false if there is no "@" or dot' do
      expect(emailValidator.isEmailValid?("taigir")).to be false
    end
    
    it 'should return false if there is no domain name' do
      expect(emailValidator.isEmailValid?("taigir@gmail.")).to be false
    end
    
    it 'should return false if email is blank' do
      expect(emailValidator.isEmailValid?("")).to be false
    end
    
    it 'should return true if email is proper' do
      expect(emailValidator.isEmailValid?("taigir@gmail.com")).to be true
    end
    
    it 'should return true if email is has more than one domain' do
      expect(emailValidator.isEmailValid?("taigir@iag.com.gov.au")).to be true
    end

    it 'should return true if email is in uppercase' do
      expect(emailValidator.isEmailValid?("TAIGIR@GMAIL.COM")).to be true
    end

    it 'should return true if email has some special characters' do
      expect(emailValidator.isEmailValid?("taigir_rules@o'course.com")).to be true
    end
    
  end
end
