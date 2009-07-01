# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_lutte_session',
  :secret      => '70d7afdd12f7b17f84ab6893a4d46af716f98718f008a9093ddd918e0fd8b1fe8ddd86cf774775df84adb0d1f9b62f79e7776b1fbac73dd3305bdff4f30c8071'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
