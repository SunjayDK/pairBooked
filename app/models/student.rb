class Student < ApplicationRecord
  validates_presence_of :username, :email
  validates_uniqueness_of :username, :email

  def self.create_with_omniauth(omniauth_hash)
    create! do |student|
      p omniauth_hash
      student.username = omniauth_hash["uid"]
      student.fullname = omniauth_hash["info"]["name"]
      student.email = omniauth_hash["info"]["email"]
    end
  end
end