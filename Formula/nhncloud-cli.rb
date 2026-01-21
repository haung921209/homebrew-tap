class NhncloudCli < Formula
  desc "Command line interface for NHN Cloud services"
  homepage "https://github.com/haung921209/nhn-cloud-cli"
  url "https://github.com/haung921209/nhn-cloud-cli/archive/refs/tags/v0.7.13.tar.gz"
  sha256 "59720e7c222ce2fd12b6aa3edd91ba0050c2fe5cabda53ba64a6d96488a0e94b"
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
