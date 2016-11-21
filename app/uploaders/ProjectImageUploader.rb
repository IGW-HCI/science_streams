class ProjectImageUploader < Shrine
  include ImageProcessing::MiniMagick

  plugin :activerecord
  plugin :determine_mime_type
  plugin :logging, logger: Rails.logger
  plugin :store_dimensions
  plugin :validation_helpers
  plugin :versions
  plugin :processing

  Attacher.validate do
    validate_max_size 3.megabytes
    validate_mime_type_inclusion ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  end

  process(:store) do |io|
    original = io.download

    size300 = resize_to_limit!(original, 300, 300)
    size100 = resize_to_limit(size300, 100, 100)

    { original: io, medium: size300, thumb: size100 }
  end
end
