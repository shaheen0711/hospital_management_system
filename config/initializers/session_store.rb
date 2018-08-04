# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_hospital_management_system_session',
  :secret      => '9c54ca624dc6bc93fad01e450a77dc4ea0e4339473b0a05b852cd55b1680f0261c40c75727b2abe40bcec37ca094d758408d29f2ccd0e3f4be74a45d5adf97fd'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
