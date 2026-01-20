class NhncloudCli < Formula
  desc "Command line interface for NHN Cloud services"
  homepage "https://github.com/haung921209/nhn-cloud-cli"
  url "https://github.com/haung921209/nhn-cloud-cli/archive/refs/tags/v0.7.11.tar.gz"
  sha256 "e8924fddafde959a6be3a7f68feb59c0b07088577e63aebd74b5b506df37742d"
  license "Apache-2.0"

  depends_on "go" => :build

  def install
    ldflags = %W[
      -s -w
      -X github.com/haung921209/nhn-cloud-cli/cmd.Version=#{version}
      -X github.com/haung921209/nhn-cloud-cli/cmd.GitCommit=#{tap.user}
      -X github.com/haung921209/nhn-cloud-cli/cmd.BuildDate=#{time.iso8601}
    ]
    system "go", "build", *std_go_args(ldflags:), "-o", bin/"nhncloud", "."
  end

  test do
    assert_match "NHN Cloud CLI", shell_output("#{bin}/nhncloud --help")
    assert_match version.to_s, shell_output("#{bin}/nhncloud version")
  end
end
