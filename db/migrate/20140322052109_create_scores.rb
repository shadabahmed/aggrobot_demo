class CreateScores < ActiveRecord::Migration
  def change
    create_table :scores do |t|
      t.string   :name
      t.string   :venue
      t.integer  :score
      t.string   :match_result
      t.boolean  :not_out
      t.string   :against
      t.string   :played_in
      t.timestamps
    end
  end
end
