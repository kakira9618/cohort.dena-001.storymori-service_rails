class Page < ApplicationRecord
  belongs_to :story
  belongs_to :page, optional: true
end
