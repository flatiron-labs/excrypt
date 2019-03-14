defmodule ExcryptTest do
  use ExUnit.Case
  doctest Excrypt

  @key "ld9p1COMK3VogmdlfCVwKw=="
  @text "I am super secret please encrypt me"

  describe "generate secret" do
    test "generates a secret key" do
      secret = :base64.decode(Excrypt.generate_secret)
      assert byte_size(secret) == 16
      assert is_binary(secret) == true
    end
  end

  describe "encrypt" do
    test "it encrypts and base64 encodes a string" do
      encrypted = Excrypt.encrypt(@text, @key)
      assert byte_size(encrypted) == 92
      assert is_binary(encrypted) == true
    end
  end

  describe "decrypt" do
    test "it decrypts and base64 encodes a string" do
      encrypted = Excrypt.encrypt(@text, @key)
      decrypted = Excrypt.decrypt(encrypted, @key)
      assert decrypted == @text
    end
  end
end
