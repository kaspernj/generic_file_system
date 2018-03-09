class GenericFileSystem::Local::Folder
  attr_reader :id, :name, :full_path

  def initialize(full_path:, name:, id:)
    @name = name
    @full_path = full_path
    @id = id
  end
end
