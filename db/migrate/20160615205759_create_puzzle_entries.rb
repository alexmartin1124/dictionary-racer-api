class CreatePuzzleEntries < ActiveRecord::Migration[5.0]
  def change
    create_table :puzzle_entries do |t|
      t.references :puzzle, foreign_key: true
      t.references :entry, foreign_key: true

      t.timestamps
    end
  end
end
