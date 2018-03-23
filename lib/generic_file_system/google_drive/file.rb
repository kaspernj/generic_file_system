class GenericFileSystem::GoogleDrive::File
  def initialize(google_drive:, file:)
    @file = file
    @google_drive = google_drive
  end

  def name
    @file.name
  end

  def download(io: StringIO.new)
    @google_drive.service.get_file(@file.id, download_dest: io)
  end

  def modified_at
    @modified_at ||= Time.zone.parse(@file.modified_time.to_s)
  end
end
