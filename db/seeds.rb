# This file should contain all the record creation needed to seed the database
# with its default values.
# The data can then be loaded with the rails db:seed command (or created
# alongside the database with db:setup).

DatabaseCleaner.strategy = :truncation, { except: %w[ar_internal_metadata schema_migrations] }
DatabaseCleaner.clean

death_star = Project.create!(
  title: "Death Star",
  description: "The Death Star (DS-1 platform), also known as the Death Star I,
                First Death Star, and early in its planning stages as simply the Ultimate Weapon,
                is a moon-sized deep space mobile battle station constructed by the Galactic Empire.
                Designed to fire a single planet-destroying superlaser powered by massive
                kyber crystals, it is the pet project of both the Emperor and Darth Vader.",
  about_us: "The Galactic Empire, also known as the New Order, the Old Empire, the First Galactic
             Empire, Palpatine's New Order, the Imperium or simply the Empire, is the galactic
             government established by Supreme Chancellor Palpatine to replace the Galactic Republic
             in 19 BBY and bring Sith rule to the galaxy.",
  slug: "death-star"
)

sidious = User.create!(email: "sidious@galactic.empire", password: "test123", password_confirmation: "test123")
sidious.create_profile!(
  nickname: "Darth Sidious",
  first_name: "Sheev",
  last_name: "Palpatine",
  slug: "darth-sidious"
)

vader = User.create!(email: "vader@galactic.empire", password: "test123", password_confirmation: "test123")
vader.create_profile(
  nickname: "Darth Vader",
  first_name: "Anakin",
  last_name: "Skywalker",
  slug: "darth-vader"
)

tarkin = User.create!(email: "tarkin@galactic.empire", password: "test123", password_confirmation: "test123")
tarkin.create_profile(
  nickname: "Wilhuff Tarkin",
  first_name: "Wilhuff",
  last_name: "Tarkin",
  slug: "wilhuff-tarkin"
)

death_star.projects_users << ProjectsUser.new(user_id: sidious.id, project_role: :admin)
death_star.projects_users << ProjectsUser.new(user_id: vader.id,   project_role: :admin)
death_star.projects_users << ProjectsUser.new(user_id: tarkin.id,  project_role: :collaborator)
death_star.save!
