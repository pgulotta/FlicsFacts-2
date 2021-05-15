#pragma once

#include <QObject>
#ifdef Q_OS_ANDROID
#include <QJniObject>
#include <QJniEnvironment>
#endif

class Permissions : public QObject
{
  Q_OBJECT
public:
  explicit Permissions( QObject* parent = nullptr );

  void requestExternalStoragePermission();
  bool getPermissionResult();

public slots:

private:
  int mPermissionResult{false};  //  true - "Granted", false - "Denied"

  #if defined(Q_OS_ANDROID)
  QJniObject mShowPermissionRationale;

  #endif

};

