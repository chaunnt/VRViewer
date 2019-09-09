#include "ImageFilterPlugins.h"
#include "ImageFilterPresenter.h"

#include <qqml.h>

void ImageFilterPlugins::registerTypes(const char* uri)
{
    // @uri SampleModules
    qmlRegisterType(QUrl("qrc:///QML/CameraView.qml"), uri, 1, 0, "CameraView");
}
