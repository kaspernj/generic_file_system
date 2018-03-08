class GenericFileSystem::Local
  include GenericFileSystem::CurrentDirTracker

  path = "#{File.dirname(__FILE__)}/local"

  autoload :Folder, "#{path}/folder"

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
end
