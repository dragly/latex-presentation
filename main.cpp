#include <QApplication>
#include <QQmlApplicationEngine>
#include <QtQml>
#include "latexrunner.h"

int main(int argc, char *argv[])
{
    qmlRegisterType<LatexRunner>("LatexPresentation", 1, 0, "LatexRunner");
    QApplication app(argc, argv);

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:///qml/latexpresentation/main.qml")));

    return app.exec();
}
