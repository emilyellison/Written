class AddRepliedToInquiry < ActiveRecord::Migration
  def change
    add_column :inquiries, :reply, :text
  end
end
