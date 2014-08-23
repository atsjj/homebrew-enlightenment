require 'formula'

class Efl < Formula
  version '1.11.0'

  option 'with-cocoa', '(Experimental) Build for native Cocoa engine. Applications will not be functional.'
  option 'without-gstreamer-pulseaudio', 'Build without gstreamer/pulseaudio. Native audio integration is buggy.'

  depends_on 'autoconf'
  depends_on 'autoconf-archive'
  depends_on 'automake'
  depends_on 'bullet'
  depends_on 'check'
  depends_on 'dbus'
  depends_on 'fontconfig'
  depends_on 'freetype'
  depends_on 'fribidi'
  depends_on 'gettext'
  depends_on 'giflib'
  depends_on 'glib'
  depends_on 'gnu-sed'
  depends_on 'gst-plugins-base'
  depends_on 'gst-plugins-good'
  depends_on 'gstreamer'
  depends_on 'libjpeg'
  depends_on 'libsndfile'
  depends_on 'libtiff'
  depends_on 'libtool'
  depends_on 'luajit'
  depends_on 'pkg-config'
  depends_on 'pulseaudio'
  depends_on :x11

  homepage 'http://enlightenment.org/'
  url 'http://download.enlightenment.org/rel/libs/efl/efl-1.11.0.tar.gz'
  sha256 '0a8ab66e012820cad7dd78de371f8dcbbd79cb316302e1e6c354181de35d727f'

  def install
    args = ["--prefix=#{prefix}"]

    if build.with? 'cocoa'
      opoo 'The Ecore_Cocoa is under development right now, and at a very early stage, so the applications will not be functional.'
      args << '--enable-cocoa'
    end

    if build.without? 'gstreamer-pulseaudio'
      args << '--disable-gstreamer'
      args << '--disable-gstreamer1'
      args << '--disable-pulseaudio'
    end

    system './configure', *args
    system 'make', 'install'
  end
end
