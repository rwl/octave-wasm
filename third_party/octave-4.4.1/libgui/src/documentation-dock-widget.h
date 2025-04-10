/*

Copyright (C) 2011-2018 Jacob Dawid

This file is part of Octave.

Octave is free software: you can redistribute it and/or modify it
under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

Octave is distributed in the hope that it will be useful, but
WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with Octave; see the file COPYING.  If not, see
<https://www.gnu.org/licenses/>.

*/

#if ! defined (octave_documentation_dock_widget_h)
#define octave_documentation_dock_widget_h 1

#include "octave-dock-widget.h"
#include "documentation.h"

namespace octave
{
  class documentation_dock_widget : public octave_dock_widget
  {
    Q_OBJECT

  public:

    documentation_dock_widget (QWidget *parent = nullptr);
    ~documentation_dock_widget (void);

  public slots:

    void notice_settings (const QSettings *settings);

  protected slots:

    void copyClipboard (void);
    void pasteClipboard (void);
    void selectAll (void);

    void showDoc (const QString & name);
    void registerDoc (const QString & name);
    void unregisterDoc (const QString & name);

  private:

    octave::documentation *m_docs;
  };
}

#endif
