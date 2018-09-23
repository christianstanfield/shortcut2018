class CreateConsiderations < ActiveRecord::Migration[5.1]
  def change
    create_table :considerations do |t|
      t.references :film, foreign_key: true
      t.references :award, foreign_key: true

      t.timestamps
    end
  end
end
