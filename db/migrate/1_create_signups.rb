class CreateSignups < ActiveRecord::Migration

  def up
    create_table :refinery_signups do |t|
      t.string :name
      t.string :email
      t.string :contact_number
      t.boolean :language_instruction
      t.boolean :inquiry
      t.boolean :translation
      t.boolean :coaching
      t.boolean :consultancy
      t.text :question

      t.timestamps
    end

    add_index :refinery_signups, :id
  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "signups"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/signups"})
    end

    drop_table :refinery_signups
  end

end
