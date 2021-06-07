class Category < ApplicationRecord
  has_many :transactions

  validates :name_category, presence: true


  def self.colors
    ['Escolha uma cor','red','blue','yellow','green', 'mediumslateblue', 'brown']
end

  def self.total
    if self.situacao == true 
    self.sum(:value) - params[:value]  
    else
      self.sum(:value)
    end
  end

  scope :by_category, -> category { where(evento: category)}
  scope :sum_value, -> { map{ |p| p.value }.sum.to_i }

end
