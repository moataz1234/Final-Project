import QtQuick 2.15
import QtQuick.Controls 2.15


Button {
    id: customBtn

    // Custom Properties
       property color colorDefault: "#4891d9"
       property color colorMouseOver: "#55AAFF"
       property color colorPressed: "#3F7EBD"

       QtObject{
           id: internal

           property var dynamicColor: if(customBtn.down){
                                          customBtn.down ? colorPressed : colorDefault
                                      }else{
                                          customBtn.hovered ? colorMouseOver : colorDefault
                                      }
       }


    text: qsTr("Custom Btn")
    implicitHeight: 40
    implicitWidth: 200

    background: Rectangle{
        color: internal.dynamicColor
        radius: 10
    }

    contentItem: Item{
        id:item1
        Text {
            id: textBtn
            text: customBtn.text
            font: customBtn.font
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            color: "#ffffff"
        }
    }

}
