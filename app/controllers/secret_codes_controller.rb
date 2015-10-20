require 'securerandom'

class SecretCodesController < ApplicationController

 before_action :authenticate_user!
 
  def index
    @secret_codes = SecretCode.all
  end

  def new
    @secret_code = SecretCode.new
  end

  def create
    if  params["create_secret_key_drop_down"].present?
      a = params["create_secret_key_drop_down"].to_i
      (1..a).each do
        @secret_code = SecretCode.new()
        @secret_code.code = SecretCode.new.generate_secret_code
        @secret_code.save
      end
      redirect_to secret_codes_path, notice: 'Secret code was successfully created.'
    end
  end

  def registered_user_information_json 
    @data_hash = {}
    SecretCode.all.each do |secret|
      @data_hash[secret.user.email] =  secret.code if secret.user_id
  end
     render :json => @data_hash
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def secret_code_params
    params.require(:secret_code).permit(:secret_key)
  end

end
