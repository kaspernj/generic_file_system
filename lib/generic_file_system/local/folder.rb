class GenericFileSystem::GoogleDrive::Folder
  include SimpleDelegate

  delegate :name, to: :folder

  def initialize(file:)
    @file = file
  end
end
