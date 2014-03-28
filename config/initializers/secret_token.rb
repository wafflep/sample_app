require 'securerandom'

def secure_token
  token_file = Rails.root.join('.secret')
  if File.exist?(token_file)
    # Use the existing token.
    File.read(token_file).chomp
  else
    # Generate a new token and store it in token_file.
    token = SecureRandom.hex(64)
    File.write(token_file, token)
    token
  end
end
SampleApp::Application.config.secret_key_base = 'e6f10c4a6b39301c59bd5033e3127183fc57467ce8dda94b924e185a5aa61dca5aed5ec736ecab5e1689fddb3eefd3e6433ca7251f6ed917b882b69f5d82f871'
