class GenericFileSystem::Local::Folder
  attr_reader :name, :full_path

  def initialize(full_path:, name:)
    @name = name
    @full_path = full_path
  end
end
