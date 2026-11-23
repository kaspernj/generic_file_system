require "spec_helper"
require "tmpdir"

describe GenericFileSystem::Local do
  describe "#each_folder" do
    it "lists all folders" do
      local = GenericFileSystem::Local.new
      Dir.mktmpdir do |path|
        %w[.git lib spec].each { |name| Dir.mkdir(File.join(path, name)) }
        local.chdir(path)

        results = []
        local.each_folder do |folder|
          results << folder.name
        end

        expect(results.sort).to eq [".git", "lib", "spec"]
      end
    end
  end
end
