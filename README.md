# secret_code_generate

rails g model User first_name:string last_name:string email:string

git init

git add .

git commit -m "initial commit"


gem 'device'

rails generate devise:install

rails generate devise User

rake db:create

rails g controller SecretCodes

rails g model SecretCode code:string user_id:integer

rake db:migrate

rails g bootstrap:themed secret_codes -f

rails generate mailer UserMailer


