#include "ImageFilterPresenter.h"

ImageFilterPresenter::ImageFilterPresenter(QObject * parent)
    : QObject(parent)
{

}

ImageFilterPresenter::~ImageFilterPresenter()
{

}

ImageFilterPresenter::NewEnum_t ImageFilterPresenter::getNewEnum()
{
    return m_newEnum;
}

int ImageFilterPresenter::getNewProperty()
{
    return m_newProperty;
}

void ImageFilterPresenter::setNewProperty(int newValue)
{
    Q_UNUSED(newValue);
    m_newProperty =newValue;
    Q_EMIT newPropertyChanged();
}
