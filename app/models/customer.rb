# == Schema Information
#
# Table name: customers
#
#  id                     :integer          not null, primary key
#  address                :string
#  code                   :integer
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  is_deleted             :boolean          default(FALSE)
#  name                   :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_customers_on_email                 (email) UNIQUE
#  index_customers_on_reset_password_token  (reset_password_token) UNIQUE
#
class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :cart_items, dependent: :destroy
  has_many :items, through: :cart_items
  has_many :orders, dependent: :destroy
  has_many :addresses
end
