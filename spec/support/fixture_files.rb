def fixture_image(size = :default)
  Rails.root + "spec/fixtures/test.image.#{size}.png"
end

def fixture_file(extension = :txt)
  Rails.root + "spec/fixtures/test.file.#{extension}"
end
