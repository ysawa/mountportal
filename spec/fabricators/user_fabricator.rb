Fabricator(:user) do
  email { "test#{sequence(:user_email)}@example.com" }
  male { sequence(:user_male) % 2 }
  name { "test #{sequence(:user_name)}" }
  password 'PASSWORD'
  password_confirmation 'PASSWORD'
end
