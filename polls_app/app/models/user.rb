# == Schema Information
#
# Table name: users
#
#  id        :bigint           not null, primary key
#  user_name :string           not null
#

class User < ApplicationRecord
  validates :user_name, uniqueness: true, presence: true
  has_many :authored_polls,
    primary_key: :id,
    foreign_key: :author_id,
    class_name: 'Poll'

  has_many :responses,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: 'Response'
end
