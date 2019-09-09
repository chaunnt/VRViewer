TEMPLATE = subdirs
CONFIG += ordered
SUBDIRS += \
    ImageFilterPlugins \
    ProductManagement \
    VRViewerPlugins \
    Authentication \
    VRViewerApp

ImageFilterPlugins.depends = VRViewerPlugins
ProductManagement.depends = VRViewerPlugins
Authentication.depends = VRViewerPlugins
VRViewerApp.depends = VRViewerPlugins ImageFilterPlugins ProductManagement Authentication
