import QtQuick 2.0
import QtQuick.Controls 2.15

Item {
    Rectangle {
        id: rectangle
        color: "#005f00"
        anchors.fill: parent

        Label {
            id: label
            x: 337
            y: 52
            color: "#ffffff"
            text: qsTr("Segmentation Page")
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.pointSize: 15
        }
    }

}
