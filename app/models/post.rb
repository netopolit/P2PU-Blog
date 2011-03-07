# == Schema Information
# Schema version: 20110217024852
#
# Table name: posts
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  title      :string(255)
#  content    :text
#  created_at :datetime
#  updated_at :datetime
#  user_id    :integer
#

class Post < ActiveRecord::Base
  validates :title, :presence => true
  validates :content, :presence => true
  validates :user_id, :presence => true

  belongs_to :user
  has_many :comments, :dependent => :destroy
  has_many :tags

  accepts_nested_attributes_for :tags, :allow_destroy => :true,
    :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }

  attr_accessible :title, :content, :tags_attributes
  
end
