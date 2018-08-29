#include "initializer.hpp"

#include <QApplication>
#include <QQmlContext>

#ifdef Q_OS_ANDROID
  #include <QtAndroid>
#endif

#include "fam/floatingactions.hpp"

Initializer::Initializer(QObject* parent) :
  QObject{parent},
  mMovieViewManager{parent} {
  QQmlApplicationEngine engine;

  FloatingActions::initialize(engine.rootContext(), &mQmlApplicationEngine);
  qmlRegisterSingletonType(QUrl(QStringLiteral("qrc:/Qml/Constants.qml")), "com.twentysixapps.flicsfacts2.constants", 1, 0, "Constants" );
  mQmlApplicationEngine.rootContext()->setContextProperty("movieSearchResponses", mMovieViewManager.movieSearchResponses() );
  mQmlApplicationEngine.rootContext()->setContextProperty("nowPlayingMoviesResponses", mMovieViewManager.nowPlayingMoviesResponses() );
  mQmlApplicationEngine.rootContext()->setContextProperty("sortedUpcomingMoviesResponses",
                                                          mMovieViewManager.sortedUpcomingMoviesResponses() );
  mQmlApplicationEngine.rootContext()->setContextProperty("sortedNowPlayingMoviesResponses",
                                                          mMovieViewManager.sortedNowPlayingMoviesResponses() );
  mQmlApplicationEngine.rootContext()->setContextProperty("MovieViewManager", &mMovieViewManager);
  mQmlApplicationEngine.load(QUrl(QStringLiteral("qrc:/Qml/main.qml")));

#ifdef Q_OS_ANDROID
  QtAndroid::hideSplashScreen();
#endif

}
