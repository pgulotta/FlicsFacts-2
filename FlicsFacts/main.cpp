#include "initializer.hpp"
#include <QApplication>
#include <QQuickStyle>

int main( int argc, char* argv[] )
{
  QCoreApplication::setAttribute( Qt::AA_EnableHighDpiScaling );
  QApplication::setApplicationName( "Flics Facts" );
  QApplication::setOrganizationDomain( "twentysixapps.com" );
  QCoreApplication::setOrganizationName( QLatin1String( "26Apps" ) );
  QApplication::setApplicationVersion( "2.52" );
  QQuickStyle::setStyle( "Material" );
  QApplication app( argc, argv );
  QObject::connect( &app, &QApplication::lastWindowClosed, &app, &QApplication::quit );
  Initializer initializer;
  return app.exec();

}
