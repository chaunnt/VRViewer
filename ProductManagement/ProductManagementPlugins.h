#pragma once

#include <QQmlExtensionPlugin>

class ProductManagementPlugins : public QQmlExtensionPlugin
{
    Q_OBJECT
    Q_PLUGIN_METADATA(IID QQmlExtensionInterface_iid)

public:
    void registerTypes(const char * uri) override;
};