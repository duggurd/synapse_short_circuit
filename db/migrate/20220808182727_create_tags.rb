class CreateTags < ActiveRecord::Migration[7.0]
  def change
    create_table :tags do |t|
      t.text :name
      t.integer :count
      t.text :project_name

      t.timestamps
    end
  end
end
