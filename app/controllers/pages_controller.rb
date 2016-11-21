class PagesController < ApplicationController
  def home
  end

  def test
    Project::InviteUsers.call(
      project: {
        id: 1,
        users: [{ email: "sidious@galactic.empire" }, { email: "vader@galactic.empire" }]
      }
    )

    render nothing: true
  end

  private

  def seed_image(file_name)
    File.open(File.join(Rails.root, "/app/assets/images/seed/#{file_name}.jpg"))
  end
end
