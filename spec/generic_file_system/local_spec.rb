require "spec_helper"

describe GenericFileSystem::Local do
  describe "#each_folder" do
    it "lists all folders" do
      local = GenericFileSystem::Local.new
      local.chdir("#{File.dirname(__FILE__)}/../../")

      results = []
      local.each_folder do |folder|
        results << folder.name
      end

      expect(results.sort).to eq [".git", "lib", "spec"]
    end
  end
end
