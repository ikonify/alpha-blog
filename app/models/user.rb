class User < ActiveRecord::Base
  has_many :articles
  
  before_save { self.email = email.downcase } # Before hitting db, will turn the email to lowercase
  
  validates :username, presence: true, uniqueness: { case_sensitive: false }, 
            length: { minimum: 3, maximum: 25 }
  
  VALID_EMAIL_REGEX= /\A([\w+\-]\.?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 105 },
            uniqueness: { case_sensitive: false },
            format: { with: VALID_EMAIL_REGEX }
end