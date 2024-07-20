#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QtQml>

#include <QObject>
#include <QQmlContext>
#include "counter.h"


int main(int argc, char *argv[])
{
   // Q_INIT_RESOURCE(resources);

    QStringList paths = QCoreApplication::libraryPaths();
  //  paths.append(".");
    paths.append(QCoreApplication::applicationDirPath());

    QCoreApplication::setLibraryPaths(paths);

    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QGuiApplication app(argc, argv);
     QQmlApplicationEngine engine;

   // MyMicro clientMyMicro;
   // Counter myCounter;

    QQmlContext *context=engine.rootContext();
  //  context->setContextProperty("clientMyMicro", &clientMyMicro);

   // context->setContextProperty("MyCounter", &myCounter);
    qmlRegisterType<Counter>("MyCounter",1,0,"MyCounter");


  //  engine.load(QUrl(QLatin1String("qrc:/main.qml")));
    engine.thread()->setObjectName("MainThread");
   // engine.rootContext()->setContextProperty("factory", &factory);
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
        &app, [url](QObject *obj, const QUrl &objUrl) {
            if (!obj && url == objUrl)
                QCoreApplication::exit(-1);
        }, Qt::QueuedConnection);
    engine.load(url);

    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
