#include "application.h"
#include "fpstext.h"

#include <QUrl>
Application::Application(QObject *parent)
    : QObject{parent}
{
    registerQML();
}

void Application::registerQML()
{
    qmlRegisterSingletonType(QUrl(QStringLiteral("qrc:/Style.qml")), "SmartHome", 1, 0, "Style");
    qmlRegisterType<FPSText>("SmartHome", 1, 0, "FPSText");
}
