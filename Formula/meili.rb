# Formula/meili.rb of meilisearch/homebrew-tap. The homebrew job of
# .github/workflows/release.yml writes the version and the checksum, and pushes it.
class Meili < Formula
  desc "Command-line tool for Meilisearch and Meilisearch Cloud"
  homepage "https://github.com/meilisearch/cli"
  url "https://registry.npmjs.org/@meilisearch/cli/-/cli-0.4.0.tgz"
  sha256 "3e056a618b83eb38daad24a1a69a727c6f8116c719370770ca700b58b77b991d"
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
