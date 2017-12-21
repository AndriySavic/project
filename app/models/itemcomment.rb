class Itemcomment < ApplicationRecord
belongs_to :user
belongs_to :item

validates :text, presence: true
validates :text, length: { in: 1..400}
validates :text, format: { with: /[a-zA-Z_#][\w.!?,&|@#$%^:;'"-]*/ }

end
