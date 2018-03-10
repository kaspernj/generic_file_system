class GenericFileSystem::GoogleDrive
  include GenericFileSystem::CurrentDirTracker

  def initialize(authorization:)
    require_relative "google_drive/file"
    require_relative "google_drive/folder"

    @authorization = authorization
    @parents = []
  end

  def items(only_files: false, only_folders: false)
    Enumerator.new do |yielder|
      items = service.fetch_all(items: :files) do |token|
        service.list_files(page_token: token, fields: "nextPageToken, files(id, name, mimeType)", q: path_query)
      end

      count = 0
      items.each do |file|
        count += 1

        if file.mime_type == "application/vnd.google-apps.folder"
          next if only_files
          yielder << GenericFileSystem::GoogleDrive::Folder.new(file: file)
        else
          next if only_folders
          yielder << GenericFileSystem::GoogleDrive::File.new(google_drive: self, file: file)
        end
      end
    end
  end

  def chdir(folder)
    if folder == ".."
      @parents.pop
    else
      folder = service.list_files(q: "#{path_query} and name = '#{folder}'").files.first
      @parents << folder
    end
  end

  def service
    @service ||= proc do
      service = Google::Apis::DriveV3::DriveService.new
      service.client_options.application_name = "Generic File System Ruby Gem"
      service.authorization = @authorization
      service
    end.call
  end

private

  def current_parent
    @parents.last
  end

  def path_query
    if current_parent
      "'#{current_parent.id}' in parents"
    else
      "'root' in parents"
    end
  end
end
