# frozen_string_literal: true

class Ingredient < ApplicationRecord
validates :name, presence: true, uniqueness: true

  has_many :cocktails, through: :doses
  has_many :doses, dependent: :restrict_with_error

  before_destroy :check_for_doses

  private

  def check_for_doses
    if doses.count > 0
       # raise_error ActiveRecord::InvalidForeignKey
      return false
    end
  end


end
