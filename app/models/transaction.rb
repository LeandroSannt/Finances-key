class Transaction < ApplicationRecord
  belongs_to :category

  def self.total
    self.sum(:value)
  end

  scope :by_category, -> category { where(evento: category)}
  scope :sum_value, -> { map{ |p| p.value }.sum.to_i }

  def display_nome
    "#{name_transaction}" 
  end

  def saidas
    if self.situation == false 
      self.sum(:value)
    end
  end

  def entradas

    if self.situation == true 
      self.sum(:value)
    end
    
  end
  


end
