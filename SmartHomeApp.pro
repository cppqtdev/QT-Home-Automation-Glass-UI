QT += quick qml core svg quickcontrols2 multimedia

# You can make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
        main.cpp \
        application.cpp \
        fpstext.cpp

RESOURCES += qml.qrc
QMAKE_INFO_PLIST = Info.plist
QMAKE_INFO_PLIST = Info.plist $$escape_expand(\n\t)
QMAKE_INFO_PLIST = Info.plist \
    CFBundleIdentifier = com.dabreha.SmartHome \
    CFBundleName = SmartHome \
    CFBundleVersion = 1.0
# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH = \
    /Screens \
    /Models \
    /Components \
    /assets \

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

HEADERS += \
    application.h \
    fpstext.h
