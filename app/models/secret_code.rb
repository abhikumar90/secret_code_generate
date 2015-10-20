class SecretCode < ActiveRecord::Base
	belongs_to :user

  def user_email
    user.email  if user.present?
  end

   def generate_secret_code
    SecureRandom.uuid
   end

end
