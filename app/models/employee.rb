class Employee < ApplicationRecord
  validates :name, :lastname, :address, :phone, :salary, presence: true
  validates :salary, numericality: { only_integer: true }

  def self.to_csv
    headers = ["column one", "column two", "column three"]

    csv_data = CSV.generate(headers: true) do |csv|
      csv << headers
      csv << ["A", "B", "C"]
    end
  end
end
