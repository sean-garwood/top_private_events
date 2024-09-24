class AddLocationToEvents < ActiveRecord::Migration[7.2]
  def change
    add_column :events, :location, :string, default: "TBD"
  end
end
