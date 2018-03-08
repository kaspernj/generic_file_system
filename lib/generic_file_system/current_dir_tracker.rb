module GenericFileSystem::CurrentDirTracker
  def current_path
    @current_path
  end

  def chdir(path)
    @current_path = path
  end

  def each_file(&blk)
    items(only_files: true).each(&blk)
  end

  def each_folder(&blk)
    items(only_folders: true).each(&blk)
  end

  def each_item(&blk)
    items.each(&blk)
  end
end
