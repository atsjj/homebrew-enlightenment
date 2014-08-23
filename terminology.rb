require 'formula'

class Terminology < Formula
  version '0.6.1'

  depends_on 'efl'
  depends_on 'elementary'
  depends_on :x11

  homepage 'http://enlightenment.org/'
  url 'http://download.enlightenment.org/rel/apps/terminology/terminology-0.6.1.tar.gz'
  sha256 '1d8d67cbe31dfba0d1644c7130cf63454d8cc5006034999625be24edbcb429f2'

  def install
    args = ["--prefix=#{prefix}"]

    system './configure', *args
    system 'make', 'install'
  end
end
