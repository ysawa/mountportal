Fabricator(:image_figure, from: :figure) do
  caption 'Test Image'
  content { File.open(File.join(Rails.root, 'spec/fixtures/images/rails.png')) }
end
