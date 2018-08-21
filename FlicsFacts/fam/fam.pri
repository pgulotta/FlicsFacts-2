QT += qml quick quickcontrols2


INCLUDEPATH += $$PWD

RESOURCES += $$PWD/fam.qrc

HEADERS += \
    $$PWD/floatingactionbutton.hpp \
    $$PWD/floatingactionmenu.hpp \
    $$PWD/floatingactions.hpp  \
    $$PWD/qqmlobjectlistmodel.hpp \


SOURCES += \
    $$PWD/floatingactions.cpp \
    $$PWD/qqmlobjectlistmodel.cpp

message("fam.pri PWD=" $$PWD)


