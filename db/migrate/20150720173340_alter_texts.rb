class AlterTexts < ActiveRecord::Migration
  def change
    change_column(:texts, :from_number, :string)
    change_column(:texts, :to_number, :string)
  end
end
