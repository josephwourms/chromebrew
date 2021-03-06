require 'package'

class Newlisp < Package
  description 'newLISP is a Lisp-like, general-purpose scripting language.'
  homepage 'http://www.newlisp.org/'
  version '10.7.1'
  source_url 'https://github.com/kosh04/newlisp/archive/10.7.1.tar.gz'
  source_sha256 '87e3ea4bd2d42118af44f2f881302af32a990164fb47088bcad0be6dc88c5c48'

  #depends_on 'readline'
  #depends_on 'libffi'

  def self.build
    # This works but readline and ffi are disabled. When using the
    #  standard ./configure it's looking in the wrong place for ffi.h
    #  and readline isn't linked against libtermcap/ncurses.
    #
    # Looks like the readline issue is the system libreadline vs the
    #  one shipped with bash.
    #
    # Ideally I'll figure out how to get it building properly as follows:
    # system "./configure --prefix=/usr/local --enable-readline --enable-ffi"
    system "./configure-alt --prefix=/usr/local"
    system "make"
    system "make", "check"
  end

  def self.install
    system "make", "DESTDIR=#{CREW_DEST_DIR}", "install"
  end
end
