defmodule Excrypt do
  @moduledoc """
  Documentation for Excrypt.
  """
  @aad "AES256GCM"

  @doc """
  `generate_secret`
  Generates a random base64 encoded secret key.
  """
  def generate_secret do
    :crypto.strong_rand_bytes(16)
    |> :base64.encode
  end

  @doc """
  encrypts the given string of text with a base64-encoded secret key
  """
  def encrypt(val, key) do
    iv = :crypto.strong_rand_bytes(16)
    {ciphertext, tag} =
      :crypto.block_encrypt(:aes_gcm, decode_key(key), iv, {@aad, to_string(val), 16})
    result = iv <> tag <> ciphertext
    :base64.encode(result)
  end

  @doc """
  decrypts the given string of text with the base64-encoded secret key
  """
  def decrypt(ciphertext, key) do
    ciphertext = :base64.decode(ciphertext)
    <<iv::binary-16, tag::binary-16, ciphertext::binary>> = ciphertext
    :crypto.block_decrypt(:aes_gcm, decode_key(key), iv, {@aad, ciphertext, tag})
  end

  def decode_key(key) do
    :base64.decode(key)
  end
end
