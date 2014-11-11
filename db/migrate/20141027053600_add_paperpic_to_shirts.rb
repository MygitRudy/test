class AddPaperpicToShirts < ActiveRecord::Migration
  def self.up
    add_attachment :shirts, :paperpic
  end
  def self.down
    remove_attachment :shirts, :paperpic
  end
end
