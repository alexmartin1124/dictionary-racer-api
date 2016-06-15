class CreateUserPuzzles < ActiveRecord::Migration[5.0]
  def change
    create_table :user_puzzles do |t|
      t.references :user, foreign_key: true
      t.references :puzzle, foreign_key: true

      t.timestamps
    end
  end
end
