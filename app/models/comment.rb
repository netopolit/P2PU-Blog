# == Schema Information
# Schema version: 20110213024120
#
# Table name: comments
#
#  id         :integer         not null, primary key
#  commenter  :string(255)
#  body       :text
#  post_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user
end
