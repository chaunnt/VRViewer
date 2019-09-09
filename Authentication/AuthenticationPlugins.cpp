#include "AuthenticationPlugins.h"
#include "AuthenticationPresenter.h"

#include <qqml.h>

void AuthenticationPlugins::registerTypes(const char* uri)
{
    // @uri SampleModules
    qmlRegisterType(QUrl("qrc:///QML/CameraView.qml"), uri, 1, 0, "CameraView");
}
