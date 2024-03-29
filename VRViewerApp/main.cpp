#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QScreen>

int main(int argc, char* argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    // The binary in the desktop build is a level below the root of the project
    // This allows us to find all the plugins, without doing an install.
    engine.addImportPath("..");
    engine.addImportPath("qrc:/Applications/");
    QScreen *screen = app.screens()[0];
    double dpi = screen->physicalDotsPerInch();
    dpi-= dpi * 10/100;
    if(dpi >= 640) dpi = dpi/640; //xxxhdpi
    else if (dpi >= 480) dpi = dpi/480; //xxhdpi
    else if (dpi >= 320) dpi = dpi/320; //xhdpi
    else if (dpi >= 240) dpi = dpi/240; //hdpi
    else if (dpi >= 160) dpi = dpi/160; //mdpi
    else if (dpi >= 120) dpi = dpi/120; //ldpi
    else{
        dpi = 1;//ldpi
    }

    engine.rootContext()->setContextProperty("dpiToPixelValue",dpi);
    engine.rootContext()->setContextProperty("baseButtonHeight",40 * dpi);


    engine.load(QUrl(QLatin1String("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
