class CreateVotes < ActiveRecord::Migration[5.1]
  def change
    create_table :votes do |t|
      t.references :ballot, foreign_key: true
      t.references :film, foreign_key: true
      t.references :award, foreign_key: true

      t.timestamps
    end
  end
end
