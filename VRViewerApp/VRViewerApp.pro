QT += quick network multimedia
CONFIG += c++11
TEMPLATE = app

# The following define makes your compiler emit warnings if you use
# any Qt feature that has been marked deprecated (the exact warnings
# depend on your compiler). Refer to the documentation for the
# deprecated API to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0
android: {

    QT += androidextras
    ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android

    OTHER_FILES += \
        android/AndroidManifest.xml
#    ANDROID_EXTRA_LIBS += \
#        $$PWD/resource/lib/libcrypto.so \
#        $$PWD/resource/lib/libssl.so
}

SOURCES += main.cpp

RESOURCES += qml.qrc
RESOURCES += resource/images.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH += ../ProductManagement
QML_IMPORT_PATH += ../ImageFilterPlugins
QML_IMPORT_PATH += ../VRViewerPlugins

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

DISTFILES += \
    android/AndroidManifest.xml \
    android/build.gradle \
    android/gradle/wrapper/gradle-wrapper.jar \
    android/gradle/wrapper/gradle-wrapper.properties \
    android/gradlew \
    android/gradlew.bat \
    android/res/values/libs.xml \
    android/res/values/strings.xml \
    ios/Project-Info.plist \
    android/res/drawable-hdpi/ic_launcher.png \
    android/res/drawable-mdpi/ic_launcher.png \
    android/res/drawable-xhdpi/ic_launcher.png \
    android/res/drawable-xxhdpi/ic_launcher.png \
    ios/Def-568h@2x.png \
    ios/Def-667h@2x.png \
    ios/Def-Portrait-736h@3x.png \
    ios/Def-Portrait.png \
    ios/Def-Portrait@2x.png \
    ios/Def.png \
    ios/Def@2x.png \
    ios/Icon-60.png \
    ios/Icon-60@2x.png \
    ios/Icon-60@3x.png \
    ios/Icon-72.png \
    ios/Icon-72@2x.png \
    ios/Icon-76.png \
    ios/Icon-76@2x.png \
    ios/Icon-Small-40.png \
    ios/Icon-Small-40@2x.png \
    ios/Icon-Small-50.png \
    ios/Icon-Small-50@2x.png \
    ios/Icon.png \
    ios/Icon@2x.png

android: {
    ANDROID_EXTRA_LIBS += $$OUT_PWD/../VRViewerPlugins/libVRViewerPlugins.so
    ANDROID_EXTRA_LIBS += $$OUT_PWD/../ProductManagement/libProductManagement.so
    ANDROID_EXTRA_LIBS += $$OUT_PWD/../ImageFilterPlugins/libImageFilterPlugins.so
    ANDROID_EXTRA_PLUGINS += $$OUT_PWD/VRViewerPlugins
    ANDROID_EXTRA_PLUGINS += $$OUT_PWD/ProductManagement
    ANDROID_EXTRA_PLUGINS += $$OUT_PWD/ImageFilterPlugins
}

QMAKE_LFLAGS *= -L../VRViewerPlugins
QMAKE_LFLAGS *= -L../ProductManagement
QMAKE_LFLAGS *= -L../ImageFilterPlugins

DEPENDPATH += . ../ImageFilterPlugins
DEPENDPATH += . ../ProductManagement
DEPENDPATH += . ../VRViewerPlugins

LIBS += -L../VRViewerPlugins/ -lVRViewerPlugins
LIBS += -L../ProductManagement/ -lProductManagement
LIBS += -L../ImageFilterPlugins/ -lImageFilterPlugins

TARGET = $$qtLibraryTarget($$TARGET)
INSTALLS += $$TARGET_INSTALL_PATH
