
class Product < ActiveRecord::Base

  belongs_to :category
  validates :title, :description, presence: true
  validates :price, numericality: { greater_than: 0 }, presence: true
  #validates :email, email: true
  validate :title_is_shorter_than_description 
  
  before_validation :strip_title

  def strip_title
    self.title = title.strip
  end

    

  def title_is_shorter_than_description
    return if title.blank? or description.blank?
    if description.length < title.length
      errors.add(:description, 'can\'t to be shorter than title')
    end
  end
end