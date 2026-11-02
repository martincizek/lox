# lox built from the `domus` branch of this fork: a release of
# discostu105/lox plus fixes that wait for upstream. Source only:
#   brew install --HEAD martincizek/lox/lox
#   brew upgrade --fetch-HEAD lox   (after a push to `domus`)
class Lox < Formula
  desc "Loxone Miniserver CLI — control lights, blinds, and automations from your terminal"
  homepage "https://github.com/martincizek/lox"
  head "https://github.com/martincizek/lox.git", branch: "domus"
  license "Apache-2.0"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
    generate_completions_from_executable(bin/"lox", "completions")
  end

  test do
    assert_match "lox", shell_output("#{bin}/lox --help")
  end
end
