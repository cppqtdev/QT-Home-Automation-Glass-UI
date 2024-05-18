#include <QFont>
#include <QFontDatabase>
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QQuickStyle>

#include "application.h"

int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif
    QGuiApplication app(argc, argv);
    QQuickStyle::setStyle("Basic");

    QFontDatabase::addApplicationFont(":/fonts/Lato-Regular.ttf");
    QFont font("Lato");
    font.setPointSize(16);
    QGuiApplication::setFont(font);

    Application *_app = new Application();
    Q_UNUSED(_app)

    QQmlApplicationEngine engine;
    engine.addImportPath("qrc:/");

    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
        &app, [url](QObject *obj, const QUrl &objUrl) {
            if (!obj && url == objUrl)
                QCoreApplication::exit(-1);
        }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
