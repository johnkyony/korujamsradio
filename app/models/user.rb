# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  role_id                :integer
#  provider               :string
#  uid                    :string
#  name                   :string
#  image                  :text
#

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable ,:omniauthable, :omniauth_providers => [:facebook]
  belongs_to :role
  after_initialize :set_default_role, :if => :new_record?
  
  
  def self.create_from_omniauth(params)
    user = find_or_create_by(email: params.info.email , uid: params.uid)
    user.password = Devise.friendly_token[0,20]
   
    user.update({
      token: params.credentials.token , 
      name: params.info.name , 
      image: params.info.image
    })
    user
    
  end     
  
  
  private
  def set_default_role
    self.role ||= Role.find_by_name('listener')
  end
end
