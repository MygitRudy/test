class Shirt < ActiveRecord::Base
  belongs_to :user
  validates :paperpic,
      attachment_content_type: { content_type: /\Aimage\/.*\Z/ },
      attachment_size: { less_than: 5.megabytes }
  validates :user_id, presence:true
      
  has_attached_file :paperpic, styles:{thumb:'200x200>'}
  
end
