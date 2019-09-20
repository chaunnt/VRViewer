#pragma once

#include <QObject>

class ProductItem : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString productName READ getProductName WRITE setProductName NOTIFY productNameChanged)
    Q_PROPERTY(QString productSource READ getProductSource WRITE setProductSource NOTIFY productSourceChanged)
    Q_PROPERTY(QString productStore READ getProductStore WRITE setProductStore NOTIFY productStoreChanged)

public:
    explicit ProductItem(QObject* parent = nullptr);
    ProductItem(QString name, QString source);
    QString getProductName();
    void setProductName(QString newValue);
    Q_SIGNAL void productNameChanged();

    QString getProductSource();
    void setProductSource(QString newValue);
    Q_SIGNAL void productSourceChanged();

    QString getProductStore();
    void setProductStore(QString newValue);
    Q_SIGNAL void productStoreChanged();
private:
    QString m_ProductName;
    QString m_ProductSource;
    QString m_ProductStore;
};
