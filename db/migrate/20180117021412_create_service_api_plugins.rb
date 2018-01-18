class CreateServiceApiPlugins < ActiveRecord::Migration[5.1]
  def change
    create_table :service_api_plugins do |t|
      t.string :name
      t.string :version

      t.timestamps
    end
  end
end
