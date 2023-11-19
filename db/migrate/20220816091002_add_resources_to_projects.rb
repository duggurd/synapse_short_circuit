class AddResourcesToProjects < ActiveRecord::Migration[7.0]
  def change
    add_column :projects, :resources, :text
  end
end
