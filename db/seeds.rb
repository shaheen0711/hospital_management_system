default_admin = User.find_or_initialize_by(username: "shaheen@gmail.com")
default_admin.assign_attributes(
  first_name: "Shaheen",
  last_name: "Admin",
  user_type: "admin",
  password: "abc123"
)
default_admin.save!
