TEMPLATE = app

QT += qml quick widgets

SOURCES += main.cpp \
            latexrunner.cpp

HEADERS += \
    latexrunner.h


RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)

OTHER_FILES += \
    images/density-trim.png

copydata.commands = $(COPY_DIR) $$PWD/qml $$OUT_PWD
first.depends = $(first) copydata
export(first.depends)
export(copydata.commands)
QMAKE_EXTRA_TARGETS += first copydata
