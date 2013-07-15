Fabricator(:user) do
  email { "test#{sequence(:user)}@example.com" }
  password 'PASSWORD'
  password_confirmation 'PASSWORD'
end
