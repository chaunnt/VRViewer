#This file is generated from QtCreator
#Using QtCreator -> File -> New File or Project
#Library -> Qt Quick 2 Extension Plugin
TEMPLATE = lib
TARGET = Authentication
QT += qml quick multimedia
CONFIG += plugin c++11
CONFIG -= android_install
TARGET = $$qtLibraryTarget($$TARGET)
uri = Authentication
version = 1.0

# Input
SOURCES += AuthenticationPlugins.cpp
HEADERS += AuthenticationPlugins.h

HEADERS += AuthenticationPresenter.h
SOURCES += AuthenticationPresenter.cpp

DISTFILES = qmldir

!equals(_PRO_FILE_PWD_, $$OUT_PWD) {
    copy_qmldir.target = $$OUT_PWD/qmldir
    copy_qmldir.depends = $$_PRO_FILE_PWD_/qmldir
    copy_qmldir.commands = $(COPY_FILE) "$$replace(copy_qmldir.depends, /, $$QMAKE_DIR_SEP)" "$$replace(copy_qmldir.target, /, $$QMAKE_DIR_SEP)"
    QMAKE_EXTRA_TARGETS += copy_qmldir
    PRE_TARGETDEPS += $$copy_qmldir.target
}

qmldir.files = qmldir
unix {
    installPath = $$[QT_INSTALL_QML]/$$replace(uri, \., /)
    qmldir.path = $$installPath
    target.path = $$installPath
    INSTALLS += target qmldir
}

RESOURCES += \
    qml.qrc \
    images.qrc

QML_IMPORT_PATH += ../VRViewerPlugins
