class CreateBallots < ActiveRecord::Migration[5.1]
  def change
    create_table :ballots do |t|
      t.string :code
      t.boolean :voted

      t.timestamps
    end
  end
end
