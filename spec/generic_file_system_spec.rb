require File.expand_path("spec_helper", __dir__)

describe "GenericFileSystem" do
  it "exposes local filesystem support" do
    expect(GenericFileSystem::Local).to be < Object
  end
end
