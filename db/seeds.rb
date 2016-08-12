# This file should contain all the record creation needed to seed the database
# with its default values.
# The data can then be loaded with the rails db:seed command (or created
# alongside the database with db:setup).

DatabaseCleaner.strategy = :truncation, { except: %w[ar_internal_metadata schema_migrations] }
DatabaseCleaner.clean

upload_dir = File.join(Rails.root, "public", "system")
FileUtils.rm_rf("#{upload_dir}/.", secure: true)

def seed_image(file_name)
  File.open(File.join(Rails.root, "/app/assets/images/seed/#{file_name}.jpg"))
end

seed_dir = File.join(Rails.root, "db", "seeds")
Dir["#{seed_dir}/*.rb"].each { |file| require file }
