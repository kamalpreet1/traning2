class Product < ActiveRecord::Base
default_scope :order => 'title'

attr_accessible :description, :image_url, :price, :title
validates:title,:description,:image_url, :presence=>true
validates :price, :numericality => {:greater_than_or_equal_to => 0.01}
validates_length_of :title, :minimum=>10, :message=> 'hello kamal'
validates :title, :uniqueness => true
validates :image_url, :format => {:with=> %r{\.(gif|jpg|png|jpeg)$}i,:message => 'must be a URL for GIF, JPG or PNG image.'}


has_many :line_items
before_destroy :ensure_not_referenced_by_any_line_item
# ensure that the line_item is refercing to any product 
def ensure_not_referenced_by_any_line_item
if line_items.count.zero?
return true
else
errors[:base] << "Line Items present"
return false
end
end
end
