class CreateTexts < ActiveRecord::Migration
  def change
    create_table :texts do |t|
      t.column :body, :string
      t.column :from_number, :integer
      t.column :to_number, :integer
      t.timestamps
    end
  end
end
