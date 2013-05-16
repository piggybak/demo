# This migration comes from piggybak_engine (originally 20121210211600)
class ChangeUserAgentType < ActiveRecord::Migration
  def up
    change_column :orders, :user_agent, :text
  end

  def down
    change_column :orders, :user_agent, :string
  end
end
