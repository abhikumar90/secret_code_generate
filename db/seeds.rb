user = User.create(email:            'admin@admin.com',
            password:                'admin@123',
            password_confirmation:   'admin@123',
            first_name:                   'mydeal247',
            last_name:                    'Admin')
user.create_secret_code(code: SecretCode.new.generate_secret_code)

