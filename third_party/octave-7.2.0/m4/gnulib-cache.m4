# Copyright (C) 2002-2021 Free Software Foundation, Inc.
#
# This file is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 3 of the License, or
# (at your option) any later version.
#
# This file is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this file.  If not, see <https://www.gnu.org/licenses/>.
#
# As a special exception to the GNU General Public License,
# this file may be distributed as part of a program that
# contains a configuration script generated by Autoconf, under
# the same distribution terms as the rest of that program.
#
# Generated by gnulib-tool.
#
# This file represents the specification of how gnulib-tool is used.
# It acts as a cache: It is written and read by gnulib-tool.
# In projects that use version control, this file is meant to be put under
# version control, like the configure.ac and various Makefile.am files.


# Specification in the form of a command-line invocation:
# gnulib-tool --import --local-dir=gl \
#  --lib=libgnu \
#  --source-base=libgnu \
#  --m4-base=m4 \
#  --doc-base=doc \
#  --tests-base=tests \
#  --aux-dir=build-aux \
#  --no-conditional-dependencies \
#  --libtool \
#  --macro-prefix=gl \
#  areadlink \
#  base64 \
#  bison \
#  canonicalize \
#  chdir \
#  clock-time \
#  close \
#  closedir \
#  crypto/md2-buffer \
#  crypto/md4-buffer \
#  crypto/md5-buffer \
#  crypto/sha1-buffer \
#  crypto/sha256-buffer \
#  crypto/sha512-buffer \
#  dup2 \
#  fcntl \
#  filemode \
#  fnmatch \
#  fpucw \
#  frexp \
#  frexpf \
#  fseek \
#  ftell \
#  ftruncate \
#  getcwd \
#  gethostname \
#  getopt-gnu \
#  getrusage \
#  gettimeofday \
#  glob \
#  intprops \
#  isatty \
#  largefile \
#  lib-symbol-visibility \
#  link \
#  localcharset \
#  lstat \
#  malloc-gnu \
#  mkdir \
#  mkfifo \
#  mkostemp \
#  mkostemps \
#  mktime \
#  nanosleep \
#  nproc \
#  nstrftime \
#  open \
#  opendir \
#  pipe-posix \
#  progname \
#  putenv \
#  raise \
#  readdir \
#  rewinddir \
#  rmdir \
#  select \
#  setlocale \
#  sigaction \
#  signal \
#  sigprocmask \
#  stat \
#  stddef \
#  stdio \
#  strdup-posix \
#  strerror \
#  strptime \
#  strsignal \
#  symlink \
#  sys_stat \
#  sys_time \
#  sys_times \
#  sys_wait \
#  tempname \
#  tmpfile \
#  uname \
#  unicase/u8-tolower \
#  unicase/u8-toupper \
#  uniconv/u32-conv-to-enc \
#  uniconv/u8-conv-from-enc \
#  uniconv/u8-conv-to-enc \
#  unictype/ctype-alnum \
#  unictype/ctype-alpha \
#  unictype/ctype-blank \
#  unictype/ctype-cntrl \
#  unictype/ctype-digit \
#  unictype/ctype-graph \
#  unictype/ctype-lower \
#  unictype/ctype-print \
#  unictype/ctype-punct \
#  unictype/ctype-space \
#  unictype/ctype-upper \
#  unictype/ctype-xdigit \
#  unistd \
#  unistr/u16-to-u8 \
#  unistr/u32-to-u8 \
#  unistr/u8-check \
#  unistr/u8-mbsnlen \
#  unistr/u8-strmblen \
#  unistr/u8-strmbtouc \
#  unistr/u8-to-u16 \
#  unistr/u8-to-u32 \
#  unlink \
#  unsetenv \
#  vasprintf \
#  waitpid \
#  windows-spawn

# Specification in the form of a few gnulib-tool.m4 macro invocations:
gl_LOCAL_DIR([gl])
gl_MODULES([
  areadlink
  base64
  bison
  canonicalize
  chdir
  clock-time
  close
  closedir
  crypto/md2-buffer
  crypto/md4-buffer
  crypto/md5-buffer
  crypto/sha1-buffer
  crypto/sha256-buffer
  crypto/sha512-buffer
  dup2
  fcntl
  filemode
  fnmatch
  fpucw
  frexp
  frexpf
  fseek
  ftell
  ftruncate
  getcwd
  gethostname
  getopt-gnu
  getrusage
  gettimeofday
  glob
  intprops
  isatty
  largefile
  lib-symbol-visibility
  link
  localcharset
  lstat
  malloc-gnu
  mkdir
  mkfifo
  mkostemp
  mkostemps
  mktime
  nanosleep
  nproc
  nstrftime
  open
  opendir
  pipe-posix
  progname
  putenv
  raise
  readdir
  rewinddir
  rmdir
  select
  setlocale
  sigaction
  signal
  sigprocmask
  stat
  stddef
  stdio
  strdup-posix
  strerror
  strptime
  strsignal
  symlink
  sys_stat
  sys_time
  sys_times
  sys_wait
  tempname
  tmpfile
  uname
  unicase/u8-tolower
  unicase/u8-toupper
  uniconv/u32-conv-to-enc
  uniconv/u8-conv-from-enc
  uniconv/u8-conv-to-enc
  unictype/ctype-alnum
  unictype/ctype-alpha
  unictype/ctype-blank
  unictype/ctype-cntrl
  unictype/ctype-digit
  unictype/ctype-graph
  unictype/ctype-lower
  unictype/ctype-print
  unictype/ctype-punct
  unictype/ctype-space
  unictype/ctype-upper
  unictype/ctype-xdigit
  unistd
  unistr/u16-to-u8
  unistr/u32-to-u8
  unistr/u8-check
  unistr/u8-mbsnlen
  unistr/u8-strmblen
  unistr/u8-strmbtouc
  unistr/u8-to-u16
  unistr/u8-to-u32
  unlink
  unsetenv
  vasprintf
  waitpid
  windows-spawn
])
gl_AVOID([])
gl_SOURCE_BASE([libgnu])
gl_M4_BASE([m4])
gl_PO_BASE([])
gl_DOC_BASE([doc])
gl_TESTS_BASE([tests])
gl_LIB([libgnu])
gl_MAKEFILE_NAME([])
gl_LIBTOOL
gl_MACRO_PREFIX([gl])
gl_PO_DOMAIN([])
gl_WITNESS_C_MACRO([])
