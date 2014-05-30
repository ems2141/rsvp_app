def create_user(attributes = {})
  user = new_user(attributes)
  user.save!
  user
end

def new_user(attributes= {})
  defaults = {
      name: "Jake",
      email: "jake@example.com",
      password: "hello123",
      wedding_password: "ellieandnick2015"
  }
  User.new(defaults.merge(attributes))
end