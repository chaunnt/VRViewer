#include "ProductManagementPresenter.h"
#include "ProductItem.h"

#include <QDebug>
#include <QFile>
#include <QJsonArray>
#include <QJsonDocument>
#include <QJsonObject>

ProductManagementPresenter::ProductManagementPresenter(QObject* parent)
    : QObject(parent)
{
    _loadProductList();
}

ProductManagementPresenter::~ProductManagementPresenter() {}

QVariant ProductManagementPresenter::getProductList()
{
    return QVariant::fromValue(m_ProductList);
}

void ProductManagementPresenter::updateProductListByStore(QString storeName)
{
    _loadProductList(storeName);
}

void ProductManagementPresenter::_loadProductList(QString storeName)
{
    QFile productListFile(":/productlist.json");
    m_ProductList.clear();
    if (productListFile.exists())
    {
        productListFile.open(QFile::ReadOnly);
        QByteArray productData = productListFile.readAll();
        QJsonArray jsArray = QJsonDocument::fromJson(productData).object().value("productList").toArray();
        productListFile.close();
        for (int i = 0; i < jsArray.count(); ++i)
        {
            QJsonObject jsObj = jsArray[i].toObject();
            QString productName = jsObj["productName"].toString();
            QString productImage = jsObj["productImage"].toString();
            ProductItem* newProduct = new ProductItem(productName, productImage);
            newProduct->setProductStore(jsObj["productStore"].toString());
            if (newProduct->getProductStore() == storeName || storeName == "")
            {
                m_ProductList.append(newProduct);
            }
        }
    }

    Q_EMIT productListChanged();
}
