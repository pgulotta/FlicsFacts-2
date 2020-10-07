#include "initializer.hpp"
#include "../FlicsFacts/Controller/permissions.hpp"
#include <QApplication>
#include <QQuickStyle>

int main( int argc, char* argv[] )
{
  QCoreApplication::setAttribute( Qt::AA_EnableHighDpiScaling );
  QApplication::setApplicationName( "Flics Facts" );
  QApplication::setOrganizationDomain( "twentysixapps.com" );
  QCoreApplication::setOrganizationName( QLatin1String( "26Apps" ) );
  QApplication::setApplicationVersion( "2.60" );
  QQuickStyle::setStyle( "Material" );
  QApplication app( argc, argv );
  QObject::connect( &app, &QApplication::lastWindowClosed, &app, &QApplication::quit );
  Initializer initializer;
  Permissions permissions;
  permissions.requestExternalStoragePermission();

  if ( permissions.getPermissionResult() ) {
    qInfo( "Successfully obtained required permissions, app starting" );
    return app.exec();
  } else {
    qWarning( "Failed to obtain required permissions, app terminating" );
  }
}
