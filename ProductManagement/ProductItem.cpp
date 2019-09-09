#include "ProductItem.h"

ProductItem::ProductItem(QObject *parent)
    : QObject(parent)
{

}

ProductItem::ProductItem(QString name, QString source)
{
    m_ProductName = name;
    m_ProductSource = source;
}

QString ProductItem::getProductName()
{
    return m_ProductName;
}

void ProductItem::setProductName(QString newValue)
{
    m_ProductName = newValue;
    Q_EMIT productNameChanged();
}

QString ProductItem::getProductSource()
{
    return m_ProductSource;
}

void ProductItem::setProductSource(QString newValue)
{
    m_ProductSource = newValue;
    Q_EMIT productSourceChanged();
}
