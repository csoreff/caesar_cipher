require_relative '../lib/caesar_cipher.rb'

describe 'CaesarCipher' do

  encrypter = CaesarCipher.new(4)

  it 'encrypts a string' do
    expect(encrypter.encrypt 'hello').to eq 'dahhk'
  end

  it 'encrypts a string with capital letters' do
    expect(encrypter.encrypt 'Hello').to eq 'Dahhk'
  end

  it 'encrypts a string with spaces and punctuation' do
    expect(encrypter.encrypt 'Hello my friend!').to eq 'Dahhk iu bneajz!'
  end

  it 'encrypts a string that will hit left boundary' do
    expect(encrypter.encrypt 'abcd').to eq 'wxyz'
  end

  it 'decrypts a string' do
    expect(encrypter.decrypt 'dahhk').to eq 'hello'
  end

  it 'decrypts a string with capital letters' do
    expect(encrypter.decrypt 'Dahhk').to eq 'Hello'
  end

  it 'decrypts a string with spaces and punctuation' do
    expect(encrypter.decrypt 'Dahhk iu bneajz!').to eq 'Hello my friend!'
  end

  it 'decrypts a string that will hit right boundary' do
    expect(encrypter.decrypt 'wxyz').to eq 'abcd'
  end
end
