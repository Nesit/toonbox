class AddAbout < ActiveRecord::Migration
  def up
    VirtualPage.create(name: "about", html_title: "О нас",
                       html_keywords: "words", html_description: "description")
    VirtualPage.save!
  end

  def down
  end
end
