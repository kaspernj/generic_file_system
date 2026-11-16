require File.expand_path(File.dirname(__FILE__) + "/spec_helper")

describe "GenericFileSystem" do
  it "exposes local filesystem support" do
    expect(GenericFileSystem::Local).to be < Object
  end
end
