class User < ActiveRecord::Base
  has_many :goods
  has_many :comments, :dependent => :destroy
end
