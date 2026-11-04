# Formula/meili.rb of meilisearch/homebrew-tap. The homebrew job of
# .github/workflows/release.yml writes the version and the checksum, and pushes it.
class Meili < Formula
  desc "Command-line tool for Meilisearch and Meilisearch Cloud"
  homepage "https://github.com/meilisearch/cli"
  url "https://registry.npmjs.org/@meilisearch/cli/-/cli-0.2.0.tgz"
  sha256 "262fa61c879e92bb7e08ffdde0cc564a73dd656f89eb1d1467fb8edf10d2f75a"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink libexec.glob("bin/*")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/meili --version")
  end
end
