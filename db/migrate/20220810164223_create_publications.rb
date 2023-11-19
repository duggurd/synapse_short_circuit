class CreatePublications < ActiveRecord::Migration[7.0]
  def change
    create_table :publications do |t|
      t.text :name
      t.text :description
      t.text :body
      t.text :resources
      t.integer :stage
      t.boolean :hidden
      t.text :github_link

      t.timestamps
    end
  end
end
