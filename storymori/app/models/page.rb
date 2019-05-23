class Page < ApplicationRecord
  belongs_to :story
  
  belongs_to :parent, class_name: "Page", optional: true
  has_many :children, class_name: "Page", foreign_key: "parent_id"
end
