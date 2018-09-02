TEMPLATE = app

QT += qml \
    quick \
    quickcontrols2 \
    widgets \
    network \

android {
    QT += androidextras
}

CONFIG += c++14


include(./fam/fam.pri)

SOURCES += main.cpp \
    initializer.cpp \
    Controller/movieviewmanager.cpp \
    Controller/shareclient.cpp \
    Controller/shareresponsesformatter.cpp \
    Controller/moviesearchparser.cpp


HEADERS += \
    initializer.hpp \
    Controller/movieviewmanager.hpp \
    Controller/shareclient.hpp \
    Controller/shareresponsesformatter.hpp \
    Controller/moviesearchparser.hpp \
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
}

unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

contains(ANDROID_TARGET_ARCH,armeabi-v7a) {
    ANDROID_EXTRA_LIBS = \
        $$PWD/android/libs/openssl/armeabi-v7a/libcrypto.so \
        $$PWD/android/libs/openssl/armeabi-v7a/libssl.so
}


contains(ANDROID_TARGET_ARCH,x86) {
    ANDROID_EXTRA_LIBS = \
        $$PWD/android/libs/openssl/x86/libcrypto.so \
        $$PWD/android/libs/openssl/x86/libssl.so
}




message(Qt version: $$[QT_VERSION])
message(Source directory = $$PWD)
message(ANDROID_TARGET_ARCH = $$ANDROID_TARGET_ARCH)
message(ANDROID_EXTRA_LIBS = $$ANDROID_EXTRA_LIBS)
message(libcrypto = $$PWD/android/libs/openssl/x86/libcrypto.so)
message(libssl = $$PWD/android/libs/openssl/x86/libssl.so)



