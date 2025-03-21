class Work < ApplicationRecord
  after_create :process_lilypond_file, if: -> { lily_file.present? }

  validates :title, presence: true

  has_one_attached :lily_file

  private

  def process_lilypond_file
    file_path = ActiveStorage::Blob.service.path_for(lily_file.key)

    ConvertLilypondJob.perform_later(file_path, title.parameterize)
  end
end
