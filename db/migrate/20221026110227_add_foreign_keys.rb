class AddForeignKeys < ActiveRecord::Migration[7.0]
  def change
    change_table(:pairs) do |t|
      t.references :currency1, foreign_key: { to_table: 'currencies' }
      t.references :currency2, foreign_key: { to_table: 'currencies' }
    end
  end
end
