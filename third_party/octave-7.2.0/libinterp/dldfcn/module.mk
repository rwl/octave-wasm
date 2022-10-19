## DO NOT EDIT -- generated from module-files by config-module.awk

EXTRA_DIST += \
  %reldir%/config-module.sh \
  %reldir%/config-module.awk \
  %reldir%/module-files \
  %reldir%/oct-qhull.h

DLDFCN_SRC = \
  %reldir%/__delaunayn__.cc \
  %reldir%/__fltk_uigetfile__.cc \
  %reldir%/__glpk__.cc \
  %reldir%/__init_fltk__.cc \
  %reldir%/__init_gnuplot__.cc \
  %reldir%/__ode15__.cc \
  %reldir%/__voronoi__.cc \
  %reldir%/audiodevinfo.cc \
  %reldir%/audioread.cc \
  %reldir%/convhulln.cc \
  %reldir%/fftw.cc \
  %reldir%/gzip.cc

DLDFCN_LIBS = $(DLDFCN_SRC:.cc=.la)

octlib_LTLIBRARIES += $(DLDFCN_LIBS)

## Use stamp files to avoid problems with checking timestamps
## of symbolic links

%.oct : %.la
	$(AM_V_GEN)$(INSTALL_PROGRAM) %reldir%/.libs/$(shell $(SED) -n -e "s/dlname='\([^']*\)'/\1/p" < $<) $@

%canon_reldir%___delaunayn___la_SOURCES = %reldir%/__delaunayn__.cc
%canon_reldir%___delaunayn___la_CPPFLAGS = $(libinterp_liboctinterp_la_CPPFLAGS) $(QHULL_CPPFLAGS)
%canon_reldir%___delaunayn___la_LDFLAGS = -avoid-version -module $(NO_UNDEFINED_LDFLAG) $(QHULL_LDFLAGS) $(OCT_LINK_OPTS) $(WARN_LDFLAGS)
%canon_reldir%___delaunayn___la_LIBADD = $(DLD_LIBOCTINTERP_LIBADD) $(QHULL_LIBS)
%canon_reldir%___delaunayn___la_DEPENDENCIES = $(OCT_LINK_DEPS)

%canon_reldir%___fltk_uigetfile___la_SOURCES = %reldir%/__fltk_uigetfile__.cc
%canon_reldir%___fltk_uigetfile___la_CPPFLAGS = $(libinterp_liboctinterp_la_CPPFLAGS) $(FLTK_CPPFLAGS) $(FT2_CPPFLAGS)
%canon_reldir%___fltk_uigetfile___la_LDFLAGS = -avoid-version -module $(NO_UNDEFINED_LDFLAG) $(FLTK_LDFLAGS) $(FT2_LDFLAGS) $(OCT_LINK_OPTS) $(WARN_LDFLAGS)
%canon_reldir%___fltk_uigetfile___la_LIBADD = $(DLD_LIBOCTINTERP_LIBADD) $(FLTK_LIBS) $(FT2_LIBS)
%canon_reldir%___fltk_uigetfile___la_DEPENDENCIES = $(OCT_LINK_DEPS)

%canon_reldir%___glpk___la_SOURCES = %reldir%/__glpk__.cc
%canon_reldir%___glpk___la_CPPFLAGS = $(libinterp_liboctinterp_la_CPPFLAGS) $(GLPK_CPPFLAGS)
%canon_reldir%___glpk___la_LDFLAGS = -avoid-version -module $(NO_UNDEFINED_LDFLAG) $(GLPK_LDFLAGS) $(OCT_LINK_OPTS) $(WARN_LDFLAGS)
%canon_reldir%___glpk___la_LIBADD = $(DLD_LIBOCTINTERP_LIBADD) $(GLPK_LIBS)
%canon_reldir%___glpk___la_DEPENDENCIES = $(OCT_LINK_DEPS)

%canon_reldir%___init_fltk___la_SOURCES = %reldir%/__init_fltk__.cc
%canon_reldir%___init_fltk___la_CPPFLAGS = $(libinterp_liboctinterp_la_CPPFLAGS) $(FLTK_CPPFLAGS) $(FT2_CPPFLAGS) $(FONTCONFIG_CPPFLAGS)
%canon_reldir%___init_fltk___la_LDFLAGS = -avoid-version -module $(NO_UNDEFINED_LDFLAG) $(FLTK_LDFLAGS) $(FT2_LDFLAGS) $(OCT_LINK_OPTS) $(WARN_LDFLAGS)
%canon_reldir%___init_fltk___la_LIBADD = $(DLD_LIBOCTINTERP_LIBADD) $(FLTK_LIBS) $(FT2_LIBS) $(OPENGL_LIBS)
%canon_reldir%___init_fltk___la_DEPENDENCIES = $(OCT_LINK_DEPS)

%canon_reldir%___init_gnuplot___la_SOURCES = %reldir%/__init_gnuplot__.cc
%canon_reldir%___init_gnuplot___la_CPPFLAGS = $(libinterp_liboctinterp_la_CPPFLAGS) $(FT2_CPPFLAGS) $(FONTCONFIG_CPPFLAGS)
%canon_reldir%___init_gnuplot___la_LDFLAGS = -avoid-version -module $(NO_UNDEFINED_LDFLAG)  $(OCT_LINK_OPTS) $(WARN_LDFLAGS)
%canon_reldir%___init_gnuplot___la_LIBADD = $(DLD_LIBOCTINTERP_LIBADD) 
%canon_reldir%___init_gnuplot___la_DEPENDENCIES = $(OCT_LINK_DEPS)

%canon_reldir%___ode15___la_SOURCES = %reldir%/__ode15__.cc
%canon_reldir%___ode15___la_CPPFLAGS = $(libinterp_liboctinterp_la_CPPFLAGS) $(SUNDIALS_XCPPFLAGS)
%canon_reldir%___ode15___la_LDFLAGS = -avoid-version -module $(NO_UNDEFINED_LDFLAG) $(SUNDIALS_XLDFLAGS) $(OCT_LINK_OPTS) $(WARN_LDFLAGS)
%canon_reldir%___ode15___la_LIBADD = $(DLD_LIBOCTINTERP_LIBADD) $(SUNDIALS_XLIBS)
%canon_reldir%___ode15___la_DEPENDENCIES = $(OCT_LINK_DEPS)

%canon_reldir%___voronoi___la_SOURCES = %reldir%/__voronoi__.cc
%canon_reldir%___voronoi___la_CPPFLAGS = $(libinterp_liboctinterp_la_CPPFLAGS) $(QHULL_CPPFLAGS)
%canon_reldir%___voronoi___la_LDFLAGS = -avoid-version -module $(NO_UNDEFINED_LDFLAG) $(QHULL_LDFLAGS) $(OCT_LINK_OPTS) $(WARN_LDFLAGS)
%canon_reldir%___voronoi___la_LIBADD = $(DLD_LIBOCTINTERP_LIBADD) $(QHULL_LIBS)
%canon_reldir%___voronoi___la_DEPENDENCIES = $(OCT_LINK_DEPS)

%canon_reldir%_audiodevinfo_la_SOURCES = %reldir%/audiodevinfo.cc
%canon_reldir%_audiodevinfo_la_CPPFLAGS = $(libinterp_liboctinterp_la_CPPFLAGS) $(PORTAUDIO_CPPFLAGS)
%canon_reldir%_audiodevinfo_la_LDFLAGS = -avoid-version -module $(NO_UNDEFINED_LDFLAG) $(PORTAUDIO_LDFLAGS) $(OCT_LINK_OPTS) $(WARN_LDFLAGS)
%canon_reldir%_audiodevinfo_la_LIBADD = $(DLD_LIBOCTINTERP_LIBADD) $(PORTAUDIO_LIBS)
%canon_reldir%_audiodevinfo_la_DEPENDENCIES = $(OCT_LINK_DEPS)

%canon_reldir%_audioread_la_SOURCES = %reldir%/audioread.cc
%canon_reldir%_audioread_la_CPPFLAGS = $(libinterp_liboctinterp_la_CPPFLAGS) $(SNDFILE_CPPFLAGS)
%canon_reldir%_audioread_la_LDFLAGS = -avoid-version -module $(NO_UNDEFINED_LDFLAG) $(SNDFILE_LDFLAGS) $(OCT_LINK_OPTS) $(WARN_LDFLAGS)
%canon_reldir%_audioread_la_LIBADD = $(DLD_LIBOCTINTERP_LIBADD) $(SNDFILE_LIBS)
%canon_reldir%_audioread_la_DEPENDENCIES = $(OCT_LINK_DEPS)

%canon_reldir%_convhulln_la_SOURCES = %reldir%/convhulln.cc
%canon_reldir%_convhulln_la_CPPFLAGS = $(libinterp_liboctinterp_la_CPPFLAGS) $(QHULL_CPPFLAGS)
%canon_reldir%_convhulln_la_LDFLAGS = -avoid-version -module $(NO_UNDEFINED_LDFLAG) $(QHULL_LDFLAGS) $(OCT_LINK_OPTS) $(WARN_LDFLAGS)
%canon_reldir%_convhulln_la_LIBADD = $(DLD_LIBOCTINTERP_LIBADD) $(QHULL_LIBS)
%canon_reldir%_convhulln_la_DEPENDENCIES = $(OCT_LINK_DEPS)

%canon_reldir%_fftw_la_SOURCES = %reldir%/fftw.cc
%canon_reldir%_fftw_la_CPPFLAGS = $(libinterp_liboctinterp_la_CPPFLAGS) $(FFTW_XCPPFLAGS)
%canon_reldir%_fftw_la_LDFLAGS = -avoid-version -module $(NO_UNDEFINED_LDFLAG) $(FFTW_XLDFLAGS) $(OCT_LINK_OPTS) $(WARN_LDFLAGS)
%canon_reldir%_fftw_la_LIBADD = $(DLD_LIBOCTINTERP_LIBADD) $(FFTW_XLIBS)
%canon_reldir%_fftw_la_DEPENDENCIES = $(OCT_LINK_DEPS)

%canon_reldir%_gzip_la_SOURCES = %reldir%/gzip.cc
%canon_reldir%_gzip_la_CPPFLAGS = $(libinterp_liboctinterp_la_CPPFLAGS) $(Z_CPPFLAGS) $(BZ2_CPPFLAGS)
%canon_reldir%_gzip_la_LDFLAGS = -avoid-version -module $(NO_UNDEFINED_LDFLAG) $(Z_LDFLAGS) $(BZ2_LDFLAGS) $(OCT_LINK_OPTS) $(WARN_LDFLAGS)
%canon_reldir%_gzip_la_LIBADD = $(DLD_LIBOCTINTERP_LIBADD) $(Z_LIBS) $(BZ2_LIBS)
%canon_reldir%_gzip_la_DEPENDENCIES = $(OCT_LINK_DEPS)

$(srcdir)/%reldir%/module.mk: $(srcdir)/%reldir%/config-module.sh $(srcdir)/%reldir%/config-module.awk $(srcdir)/%reldir%/module-files
	$(AM_V_GEN)$(SHELL) $(srcdir)/%reldir%/config-module.sh $(srcdir)

DLDFCN_OCT_FILES = $(DLDFCN_LIBS:.la=.oct)

DLDFCN_DEFUN_FILES = $(DLDFCN_SRC)

DLDFCN_PKG_ADD_FILE = %reldir%/PKG_ADD

%reldir%/PKG_ADD: $(DLDFCN_DEFUN_FILES) $(srcdir)/build-aux/mk-pkg-add.sh | %reldir%/$(octave_dirstamp)
	$(AM_V_GEN)rm -f $@-t && \
	$(SHELL) $(srcdir)/build-aux/mk-pkg-add.sh "$(srcdir)" $(DLDFCN_DEFUN_FILES) > $@-t && \
	mv $@-t $@

LIBINTERP_DEFUN_FILES += \
  $(DLDFCN_DEFUN_FILES)

OCT_FILE_PKG_ADD_FILES += \
  $(DLDFCN_PKG_ADD_FILE)

OCTAVE_INTERPRETER_TARGETS += \
  $(DLDFCN_OCT_FILES)

OCT_FILE_LIBS += \
 $(DLDFCN_LIBS)

OCT_FILES += \
 $(DLDFCN_OCT_FILES)

DIRSTAMP_FILES += %reldir%/$(octave_dirstamp)

libinterp_CLEANFILES += \
  $(DLDFCN_PKG_ADD_FILE) \
  $(DLDFCN_OCT_FILES)

libinterp_MAINTAINERCLEANFILES += \
  $(srcdir)/%reldir%/module.mk
