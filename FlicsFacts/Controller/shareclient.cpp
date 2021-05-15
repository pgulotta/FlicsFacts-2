#include "shareclient.hpp"

#ifdef Q_OS_ANDROID
#include <QJniObject>

void ShareClient::setShare( const QString& shareContent ) const
{
  QJniObject content = QJniObject::fromString( shareContent );
  QJniObject activity = QtAndroid::androidActivity();
  QJniObject::callStaticMethod<void>
  ( "com/twentysixapps/flicsfacts2/MovieShareIntent",
    "startShareActivity",
    "(Ljava/lang/String;"
    "Lorg/qtproject/qt5/android/bindings/QtActivity;)V",
    content.object<jstring>(),
    activity.object<jobject>() );
}
#else

void ShareClient::setShare( const QString& ) const
{
}


#endif

