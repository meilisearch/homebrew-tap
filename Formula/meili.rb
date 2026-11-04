# Formula/meili.rb of meilisearch/homebrew-tap. The homebrew job of
# .github/workflows/release.yml writes the version and the checksum, and pushes it.
class Meili < Formula
  desc "Command-line tool for Meilisearch and Meilisearch Cloud"
  homepage "https://github.com/meilisearch/cli"
  url "https://registry.npmjs.org/@meilisearch/cli/-/cli-0.1.0.tgz"
  sha256 "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
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
