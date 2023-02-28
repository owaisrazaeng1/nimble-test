class CreateSearchQueries < ActiveRecord::Migration[7.0]
  def change
    create_table :search_queries do |t|
      t.text :keywords, null: false, array: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
