
class Product < ActiveRecord::Base
  extend Enumerize

  belongs_to :category, optional: true
  validates :title, :description, presence: true
  validates :price, numericality: { greater_than: 0 }, presence: true
  #validates :email, email: true

  enumerize :level, in: [:hard, :medium, :easy]

  validate :title_is_shorter_than_description 
  
  before_validation :strip_title
  # name scope != params
  scope :active, -> {where(published: true)}
  scope :priced_more_than, -> (price) {where('price > ?', price)}

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