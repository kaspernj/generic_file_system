module GenericFileSystem
  path = "#{File.dirname(__FILE__)}/generic_file_system"

  autoload :CurrentDirTracker, "#{path}/current_dir_tracker"
  autoload :Local, "#{path}/local"
end
