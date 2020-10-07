TEMPLATE = app

QT += qml \
    quick \
    quickcontrols2 \
    widgets \
    network \

CONFIG += c++1z

DEFINES += QT_DEPRECATED_WARNINGS
DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000

include(./fam/fam.pri)

SOURCES += main.cpp \
    initializer.cpp \
    Controller/movieviewmanager.cpp \
    Controller/shareclient.cpp \
    Controller/shareresponsesformatter.cpp \
    Controller/permissions.cpp \
    Controller/moviesearchparser.cpp

HEADERS += \
    initializer.hpp \
    Controller/movieviewmanager.hpp \
    Controller/shareclient.hpp \
    Controller/shareresponsesformatter.hpp \
    Controller/moviesearchparser.hpp \
    Controller/permissions.hpp \
    Model/movieresponse.hpp \
    Controller/networkrequestmovieattributes.hpp \
    Model/sortedmovieresponsesmodel.hpp


DISTFILES += \
    android/gradle/wrapper/gradle-wrapper.jar \
    android/gradlew \
    android/res/values/libs.xml \
    android/res/values/strings.xml \
    android/build.gradle \
    android/gradle/wrapper/gradle-wrapper.properties \
    android/gradlew.bat \
    android/res/drawable/splash.png \
    android/res/drawable/splashscreen.xml \
    android/src/com/twentysixapps/flicsfacts2/MovieShareIntent.java \
    android/AndroidManifest.xml \

RESOURCES += qml.qrc

ICON = Resources/icon.png

QML_IMPORT_PATH += $$PWD

DEFINES += QT_USE_QSTRINGBUILDER \
    QT_DEPRECATED_WARNINGS


win32: RC_FILE = Resources/FlicsFacts.rc
gcc|clang {
    QMAKE_CXXFLAGS += -std=c++1y
}


android {
    QT += androidextras
    ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android

include(<../../../../android_openssl/openssl.pri)
}

unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

wasm {
QMAKE_LFLAGS += -s SAFE_HEAP=1
QMAKE_LFLAGS += --emrun
QMAKE_LFLAGS += -s BINARYEN_TRAP_MODE='clamp'
}

message(****  Flics Facts  ****)
message(Qt version: $$[QT_VERSION])
message(Qt is installed in $$[QT_INSTALL_PREFIX])
message(Qt resources can be found in the following locations:)
message(Documentation: $$[QT_INSTALL_DOCS])
message(Header files: $$[QT_INSTALL_HEADERS])
message(Libraries: $$[QT_INSTALL_LIBS])
message(Binary files (executables): $$[QT_INSTALL_BINS])
message(Plugins: $$[QT_INSTALL_PLUGINS])
message(Data files: $$[QT_INSTALL_DATA])
message(Translation files: $$[QT_INSTALL_TRANSLATIONS])
message(Settings: $$[QT_INSTALL_CONFIGURATION])
message(Source directory = $$PWD)
message(INCLUDEPATH = $$INCLUDEPATH)
message(ANDROID_EXTRA_LIBS = $$ANDROID_EXTRA_LIBS)





