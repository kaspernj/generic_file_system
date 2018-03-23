class GenericFileSystem::Local::File
  def initialize(file:)
    @file = file
  end

  def name
    @file.name
  end

  def modified_at
    @modified_at ||= file.mtime
  end
end
