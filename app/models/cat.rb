class Cat < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]
  
  mount_uploader :picture, PictureUploader
end
