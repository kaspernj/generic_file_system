class GenericFileSystem::GoogleDrive::Folder
  def initialize(file:)
    @file = file
  end

  def name
    @file.name
  end
end
