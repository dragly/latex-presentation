import QtQuick 2.2
import QtQuick.Window 2.0

Window {
    visible: true
    width: 1600
    height: 1200
    title: qsTr("Hello World")

    MyPresentation {
        focus: true
        anchors.fill: parent
    }
}
