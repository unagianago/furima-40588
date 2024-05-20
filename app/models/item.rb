class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :area
  belongs_to :delivery_cost
  belongs_to :delivery_time

  validates :name, presence: true
  validates :content, presence: true
  validates :price, presence: true

  validates :category_id, numericality: { other_than: 1 } 
  validates :condition_id, numericality: { other_than: 1 } 
  validates :area_id, numericality: { other_than: 1 } 
  validates :delivery_cost_id, numericality: { other_than: 1 } 
  validates :delivery_time_id, numericality: { other_than: 1 } 
end
