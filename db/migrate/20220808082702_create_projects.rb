class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.text :name
      t.float :version
      t.integer :stage
      t.text :description
      t.text :introduction
      t.text :main
      t.text :results
      t.text :currently
      t.boolean :hidden
      t.text :github_link
      t.text :resources

      t.timestamps
    end
  end
end
