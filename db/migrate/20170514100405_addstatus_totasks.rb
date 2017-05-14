class AddstatusTotasks < ActiveRecord::Migration[5.1]
  def change
    add_column :tasklists, :status, :string
  end
end
