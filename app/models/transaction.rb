class Transaction < ApplicationRecord
  belongs_to :category

  validates :name_transaction, presence: true
  validates :value, presence: true
  validates :situation, presence: true
  validates :date_transaction, presence: true

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
