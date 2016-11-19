class ToDo < ApplicationRecord
  validates_presence_of :title, :description, :due

  def due?
    return true if due.to_i < (Time.now + 5.minutes).to_i
  end
end
