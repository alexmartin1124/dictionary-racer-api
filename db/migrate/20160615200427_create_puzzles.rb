class CreatePuzzles < ActiveRecord::Migration[5.0]
  def change
    create_table :puzzles do |t|
      t.string :start_word
      t.string :end_word
      t.string :difficulty
      t.string :best_path, array: true, default: []

      t.timestamps
    end
  end
end
