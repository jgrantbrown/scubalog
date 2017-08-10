class Account < ApplicationRecord
has_secure_password
belongs_to :diver
include ActiveModel::Validations

validates :username, presence: true, uniqueness: true, on: :create
validates :first_name, presence: true
validates :last_name, presence: true
validates :email, presence: true, uniqueness: true, on: :create
validates :password_digest, presence: true, on: :create

def self.authenticate(account_info)
  account = Account.find_by(username: account_info[:username])
  account && account.authenticate(account_info[:password])
end

end
