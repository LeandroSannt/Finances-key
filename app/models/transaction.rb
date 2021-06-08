class Transaction < ApplicationRecord
  belongs_to :category
  belongs_to :user

  validates :name_transaction, presence: true
  validates :value, presence: true
  #validates :situation, presence: true
  validates :date_transaction, presence: true

  scope :category_month, ->  {where('transactions.date_transaction BETWEEN ? AND ?', Date.today.beginning_of_month, Date.today.end_of_month)}


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
