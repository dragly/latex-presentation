#include <QtGui/QApplication>
#include <QDeclarativeContext>
#include <QGraphicsObject>
#include <QtOpenGL/QGLWidget>
#include <QFontDatabase>
#include <QDir>
#include "qmlapplicationviewer.h"
#include "latexrunner.h"
Q_DECL_EXPORT int main(int argc, char *argv[])
{
    qmlRegisterType<LatexRunner>("LatexPresentation", 1, 0, "LatexRunner");
    QScopedPointer<QApplication> app(createApplication(argc, argv));

    // Load custom fonts
    QFontDatabase database;
    foreach(QString fontFile, QDir("fonts").entryList(QStringList("*.ttf"))) {
        qDebug() << "Loading custom font " << fontFile;
        database.addApplicationFont("fonts/" + fontFile);
    }

    // Start the QML application viewer
    QmlApplicationViewer viewer;
    viewer.setOrientation(QmlApplicationViewer::ScreenOrientationAuto);
    viewer.setMainQmlFile(QLatin1String("qml/mypresentation/MyPresentation.qml"));

    // Connect some signals from the QML code to the viewer
    viewer.connect(viewer.rootObject(), SIGNAL(showFullScreen()), SLOT(showFullScreen()));
    viewer.connect(viewer.rootObject(), SIGNAL(showNormal()), SLOT(showNormal()));

    // Comment the line below to disable OpenGL. Without OpenGL some fonts are prettier, but with OpenGL, videos work.
//    viewer.setViewport(new QGLWidget(&viewer));
    viewer.setRenderHint(QPainter::HighQualityAntialiasing);

    // Let's go!
    viewer.showFullScreen();
//    viewer.show();
    return app->exec();
}
