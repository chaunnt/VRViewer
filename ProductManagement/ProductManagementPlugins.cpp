#include "ProductManagementPlugins.h"
#include "ProductManagementPresenter.h"

#include <qqml.h>

void ProductManagementPlugins::registerTypes(const char* uri)
{
    // @uri SampleModules
    qmlRegisterType(QUrl("qrc:///QML/ProductList.qml"), uri, 1, 0, "ProductList");

    // C++ Types
    qmlRegisterType<ProductManagementPresenter, 0>(uri, 1, 0, "ProductManagementPresenter");
}
