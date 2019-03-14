# Excrypt
An Elixir encry
## Usage
1. Generate a shared base64 encoded secret to be used for encryption/decryption

```elixir
iex> Excrypt.generate_secret
secret = "ld9p1COMK3VogmdlfCVwKw=="
```

2. Encrypt a string with the shared secret

```elixir
iex> Excrypt.encrypt("Encrypt me!", secret)
encrypted_text = "EyYFA9EoPaZdj4kbzADoUA=="
```

3. Decrypt the string with the shared secret

```elixir
iex> Excrypt.decrypt(encrypted_text, secret)
"Encrypt me!"
```

## Installation

The package can be installed
by adding `excrypt` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:excrypt, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
or the docs can be found at [https://hexdocs.pm/excrypt](https://hexdocs.pm/excrypt).
