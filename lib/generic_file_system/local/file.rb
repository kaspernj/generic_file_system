class GenericFileSystem::Local::File
  def initialize(file:)
    @file = file
  end

  def name
    @file.name
  end
end
