#This file is generated from QtCreator
#Using QtCreator -> File -> New File or Project
#Library -> Qt Quick 2 Extension Plugin
TEMPLATE = lib
TARGET = VRViewerPlugins
QT += qml quick multimedia
CONFIG += plugin c++11
CONFIG -= android_install
TARGET = $$qtLibraryTarget($$TARGET)
uri = VRViewerPlugins
version = 1.0

# Input
SOURCES += VRViewerPlugins.cpp
HEADERS += VRViewerPlugins.h

SOURCES += Actions/ActionDispatcher.cpp
HEADERS += Actions/ActionDispatcher.h

SOURCES += Actions/ActionListener.cpp
HEADERS += Actions/ActionListener.h

HEADERS += Actions/ActionSource.h

HEADERS += Actions/IActionListener.h

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


# - setup the correct location to install to and load from
android {
    # android platform
    # From: http://community.kde.org/Necessitas/Assets
    SAMPLES_INSTALL_PATH=/assets/VRViewerPlugins
    # - setup the 'make install' step
    samples.path = $$SAMPLES_INSTALL_PATH
    samples.files += $$SAMPLE_FILES
    samples.depends += FORCE
    INSTALLS += samples
}

RESOURCES += qml.qrc
RESOURCES += images.qrc
