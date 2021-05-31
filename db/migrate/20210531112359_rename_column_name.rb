class RenameColumnName < ActiveRecord::Migration[6.1]
  def change
    rename_column :tasks, :descriotion, :description
  end
end
