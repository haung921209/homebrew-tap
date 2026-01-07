class NhncloudCli < Formula
  desc "Command line interface for NHN Cloud services"
  homepage "https://github.com/haung921209/nhn-cloud-cli"
  url "https://github.com/haung921209/nhn-cloud-cli/archive/refs/tags/v0.5.0.tar.gz"
  sha256 "3026a81d0844d25046b573c8a24f3a167237149a6a87f4205da5fdcfec4ca498"
  license "Apache-2.0"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X main.version=#{version}"), "-o", bin/"nhncloud", "."
  end

  test do
    assert_match "NHN Cloud CLI", shell_output("#{bin}/nhncloud --help")
  end
end
