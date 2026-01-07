class NhncloudCli < Formula
  desc "Command line interface for NHN Cloud services"
  homepage "https://github.com/haung921209/nhn-cloud-cli"
  version "0.4.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/haung921209/nhn-cloud-cli/releases/download/v#{version}/nhncloud-darwin-arm64"
      sha256 "5bed7b059661d5778936cb2f0e9ea0cb557432f470ff428c26d7f7967698f75b"

      def install
        bin.install "nhncloud-darwin-arm64" => "nhncloud"
      end
    end

    on_intel do
      url "https://github.com/haung921209/nhn-cloud-cli/releases/download/v#{version}/nhncloud-darwin-amd64"
      sha256 "bd2bb249d2983de30c8d22fe66b964462dbdd8336d235ae21d0455215b270746"

      def install
        bin.install "nhncloud-darwin-amd64" => "nhncloud"
      end
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/haung921209/nhn-cloud-cli/releases/download/v#{version}/nhncloud-linux-arm64"
      sha256 "23a133f8c8ca630a2c455a4dfc4f7f3f625015fe2a075ba5c21d68c0ca375651"

      def install
        bin.install "nhncloud-linux-arm64" => "nhncloud"
      end
    end

    on_intel do
      url "https://github.com/haung921209/nhn-cloud-cli/releases/download/v#{version}/nhncloud-linux-amd64"
      sha256 "90b85da4c5e12d1c4f069d80dc7cc10dd374491babfb8bd2ee6da6424623d09b"

      def install
        bin.install "nhncloud-linux-amd64" => "nhncloud"
      end
    end
  end

  test do
    assert_match "NHN Cloud CLI", shell_output("#{bin}/nhncloud --help")
  end
end
