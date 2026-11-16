class GenericFileSystem::Local::Folder
  attr_reader :name

  def initialize(full_path:, name:)
    @full_path = full_path
    @name = name
  end
end
