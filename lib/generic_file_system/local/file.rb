class GenericFileSystem::Local::File
  attr_reader :name

  def initialize(full_path:, name:)
    @full_path = full_path
    @name = name
  end

  def modified_at
    @modified_at ||= ::File.mtime(@full_path)
  end
end
