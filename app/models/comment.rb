# == Schema Information
# Schema version: 20110217220809
#
# Table name: comments
#
#  id         :integer         not null, primary key
#  body       :text
#  post_id    :integer
#  created_at :datetime
#  updated_at :datetime
#  user_id    :integer
#

class Comment < ActiveRecord::Base
  validates :user_id, :presence => true
  validates :body, :presence => true

  belongs_to :post
  belongs_to :user

  attr_accessible :body
end
