require 'formula'

class Elementary < Formula
  version '1.11.0'

  depends_on 'efl'
  depends_on :x11

  homepage 'http://enlightenment.org/'
  url 'http://download.enlightenment.org/rel/libs/elementary/elementary-1.11.0.tar.gz'
  sha256 '47ee79f7fc4e355557e6809e2001468bc8e40939562e3a96f689969ab67c17b4'

  def install
    args = ["--prefix=#{prefix}"]

    system './configure', *args
    system 'make', 'install'
  end
end
