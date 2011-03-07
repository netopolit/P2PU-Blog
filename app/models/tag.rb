# == Schema Information
# Schema version: 20110213031533
#
# Table name: tags
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  post_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class Tag < ActiveRecord::Base
  belongs_to :post
  attr_accessible :name
end
