#include "ProductManagementPresenter.h"
#include "ProductItem.h"

ProductManagementPresenter::ProductManagementPresenter(QObject * parent)
    : QObject(parent)
{
    for (int i = 0; i < 10; ++i)
    {
        ProductItem* newItem = new ProductItem("Product " + QString::number(i), "http://lamappdidong.com/dataresources/SampleObject.png");
        m_ProductList.append(newItem);
    }
}

ProductManagementPresenter::~ProductManagementPresenter()
{

}

QVariant ProductManagementPresenter::getProductList()
{
    return QVariant::fromValue(m_ProductList);
}
