class GenericFileSystem::Local
  include GenericFileSystem::CurrentDirTracker

  def initialize
    require_relative "local/file"
    require_relative "local/folder"

    @current_paths = []
  end

  def items(only_files: false, only_folders: false)
    Enumerator.new do |yielder|
      Dir.foreach(current_path) do |file|
        next if file == "." || file == ".."

        full_path = "#{current_path}/#{file}"

        if File.directory?(full_path)
          next if only_files
          yielder << GenericFileSystem::Local::Folder.new(full_path: full_path, name: file)
        else
          next if only_folders
          yielder << GenericFileSystem::Local::File.new(full_path: full_path, name: file)
        end
      end
    end
  end

  def chdir(path)
    @current_paths << path
  end

  def current_path
    @current_paths.join("/")
  end
end
