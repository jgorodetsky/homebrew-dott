class Dott < Formula
  desc "Fuzzy picker for your dotfiles: what is fine, what needs you, and the fixes"
  homepage "https://github.com/jgorodetsky/dott"
  url "https://github.com/jgorodetsky/dott/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "f7f2dc17bd31d9830dac25a02f31c8beff2b9acf3d743d0da4326fdd7bb15869"
  license "MIT"
  head "https://github.com/jgorodetsky/dott.git", branch: "main"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X main.version=#{version}"), "./cmd/dott"
  end

  test do
    assert_match "dott #{version}", shell_output("#{bin}/dott --version")
    (testpath/"repo/hello").write "hi\n"
    (testpath/"repo/dott.toml").write <<~TOML
      schema = 1

      [[item]]
      id = "hello"
      kind = "link"
      link = "~/.hello"
      to = "hello"
    TOML
    ENV["HOME"] = testpath
    ENV["DOTT_REPO"] = testpath/"repo"
    assert_match '"state": "drift"', shell_output("#{bin}/dott --json")
    refute_path_exists testpath/".hello"
  end
end
