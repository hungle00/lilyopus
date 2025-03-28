class Work < ApplicationRecord
  LILY_PATH = "tmp/storage/"

  validates :title, presence: true

  has_one_attached :lily_file

  def process_lilypond_file
    file_path = ActiveStorage::Blob.service.path_for(lily_file.key)

    ConvertLilypondJob.perform_later(file_path, title.parameterize)
  end
end
