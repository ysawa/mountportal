# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
# Mountportal::Application.config.secret_key_base = 'eb5c62ee73d432cd64fb40d4c6536c333811d690c807e38694d8b83bf00b9b2fa3832f627ae069f03134dfbe01b088956e7beac21fb1d0ffcd836ae061bcf989'
Mountportal::Application.config.secret_token = 'eb5c62ee73d432cd64fb40d4c6536c333811d690c807e38694d8b83bf00b9b2fa3832f627ae069f03134dfbe01b088956e7beac21fb1d0ffcd836ae061bcf989'
