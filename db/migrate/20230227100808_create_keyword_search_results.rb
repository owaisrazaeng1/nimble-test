class CreateKeywordSearchResults < ActiveRecord::Migration[7.0]
  def change
    create_table :keyword_search_results do |t|
      t.string :query
      t.references :search_query, null: false, foreign_key: true
      t.integer :advertisors_count
      t.integer :links_count
      t.integer :results_count
      t.text :code

      t.timestamps
    end
  end
end
