#include <QObject>
#include <QVariant>

class ProductManagementPresenter : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QVariant productList READ getProductList NOTIFY productListChanged)
public:

    explicit ProductManagementPresenter(QObject* parent = nullptr);
    virtual ~ProductManagementPresenter();

    QVariant getProductList();
    Q_SIGNAL void productListChanged();

private:
    QList<QObject*> m_ProductList;
};
