class AddAbout < ActiveRecord::Migration
  def up
    VirtualPage.create!(name: "about", html_title: "About",
                       html_keywords: "words", html_description: "description")
  end

  def down
  end
end
