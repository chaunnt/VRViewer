#include <QObject>

class AuthenticationPresenter : public QObject
{
    Q_OBJECT

public:
    explicit AuthenticationPresenter(QObject* parent = nullptr);
    virtual ~AuthenticationPresenter();
};
