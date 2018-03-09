class GenericFileSystem::GoogleDrive
  path = "#{File.dirname(__FILE__)}/local"

  autoload :File, "#{path}/file"
  autoload :Folder, "#{path}/folder"

  include GenericFileSystem::CurrentDirTracker

  def initialize(authorization:)
    @authorization = authorization
  end

  def items(only_files: false, only_folders: false)
    Enumerator.new do |yielder|
      response = service.list_files(page_size: 100, fields: 'nextPageToken, files(id, name, mimeType, parents)', q: "'root' in parents")
      response.files.each do |file|
        puts "File: #{file.name}: #{file.id}"
        puts "Parents: #{file.parents}, kind: #{file.kind}"
        puts "Inspect: #{file.inspect}"

        full_path = "#{current_path}/#{file}"

        if file.mime_type == "application/vnd.google-apps.folder"
          next if only_files
          yielder << GenericFileSystem::GoogleDrive::Folder.new(file: file)
        else
          next if only_folders
          yielder << GenericFileSystem::GoogleDrive::File.new(file: file)
        end
      end
    end
  end

private

  def service
    @service ||= proc do
      service = Google::Apis::DriveV3::DriveService.new
      service.client_options.application_name = "Generic File System Ruby Gem"
      service.authorization = @authorization
      service
    end.call
  end
end
