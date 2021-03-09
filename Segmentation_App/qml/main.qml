import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15
import "controls"

Window {
    id: mainWindow
    width: 1000
    height: 600
    minimumWidth: 800
    minimumHeight: 500
    visible: true
    color: "#00000000"
    title: qsTr("SegmentationApp")
    // Remove title bar
    flags: Qt.Window | Qt.FramelessWindowHint

    // Propeties
    property int windowStatus: 0
    property int windowMargin: 10

    //      Internal functions
    QtObject{
        id: internal

        function resetResizeBorders(){
            // Resize visibility
            resizeLeft.visible = true
            resizeRight.visible = true
            resizeBottom.visible = true
            resizeWindow.visible = true
        }

        function maximizeRestore(){
            if(windowStatus == 0){
                mainWindow.showMaximized()
                windowStatus = 1
                windowMargin = 0
                // Resize visibility
                resizeLeft.visible = false
                resizeRight.visible = false
                resizeBottom.visible = false
                resizeWindow.visible = false
                btnMaximizeRestore.btnIconSource = "../images/svg_images/restore_icon.svg"
            }
            else{
                mainWindow.showNormal()
                windowStatus = 0
                windowMargin = 10
                // Resize visibility
                internal.resetResizeBorders()
                btnMaximizeRestore.btnIconSource = "../images/svg_images/maximize_icon.svg"
            }
        }

        function ifMaximizedWindowRestore(){
            if(windowStatus == 1){
                mainWindow.showNormal()
                windowStatus = 0
                windowMargin = 10
                // Resize visibility
                internal.resetResizeBorders()
                btnMaximizeRestore.btnIconSource = "../images/svg_images/maximize_icon.svg"
            }
        }

        function restoreMargins(){
            windowStatus = 0
            windowMargin = 10
            // Resize visibility
            internal.resetResizeBorders()
            btnMaximizeRestore.btnIconSource = "../images/svg_images/maximize_icon.svg"
        }
    }


    Rectangle {
        id: background
        color: "#1c1d20"
        border.color: "#42444b"
        border.width: 1
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.rightMargin: 10
        anchors.leftMargin: 10
        anchors.bottomMargin: 10
        anchors.topMargin: 10
        z:1

        Rectangle {
            id: appcontainer
            color: "#00000000"
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.rightMargin: 1
            anchors.leftMargin: 1
            anchors.bottomMargin: 1
            anchors.topMargin: 1

            Rectangle {
                id: topbar
                height: 60
                color: "#121315"
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.rightMargin: 0
                anchors.leftMargin: 0
                anchors.topMargin: 0

                ToggleButton {
                    onClicked: animationMenu.running = true

                }

                Rectangle {
                    id: topBarDescription
                    y: 40
                    height: 25
                    color: "#1f2124"
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.bottom: parent.bottom
                    anchors.rightMargin: 0
                    anchors.leftMargin: 70
                    anchors.bottomMargin: 0

                    Label {
                        id: topdescription
                        color: "#ffffff"
                        text: qsTr("Application Description")
                        anchors.fill: parent
                        font.pointSize: 8
                        anchors.rightMargin: 300
                        anchors.leftMargin: 10
                    }
                }

                Rectangle {
                    id: titleBar
                    height: 35
                    color: "#00000000"
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.rightMargin: 105
                    anchors.leftMargin: 70
                    anchors.topMargin: 0

                    Image {
                        id: iconApp
                        width: 22
                        height: 22
                        anchors.left: parent.left
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        source: "../images/svg_images/app_icon.svg"
                        anchors.bottomMargin: 0
                        anchors.leftMargin: 5
                        anchors.topMargin: 0
                        fillMode: Image.PreserveAspectFit
                    }

                    Label {
                        id: label
                        color: "#e8e8e8"
                        text: qsTr("Segmentation Application")
                        anchors.left: iconApp.right
                        anchors.right: parent.right
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        verticalAlignment: Text.AlignVCenter
                        font.pointSize: 11
                        anchors.leftMargin: 5
                    }
                }

                Row {
                    id: rowBtns
                    x: 768
                    y: 0
                    width: 105
                    height: 35
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.topMargin: 0
                    anchors.rightMargin: 0
                    TopBar{
                        id: btnMinimize
                        onClicked: {
                            mainWindow.showMinimized()
                            internal.restoreMargins()
                        }
                    }

                    TopBar{
                        id: btnMaximizeRestore
                        btnIconSource: "../images/svg_images/maximize_icon.svg"
                        onClicked: internal.maximizeRestore()
                    }

                    TopBar {
                        id: btnClose
                        btnColorClicked: "#ff007f"
                        btnIconSource: "../images/svg_images/close_icon.svg"
                        onClicked: mainWindow.close()
                    }
                }
            }

            Rectangle {
                id: content
                color: "#00000000"
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: topbar.bottom
                anchors.bottom: parent.bottom
                anchors.rightMargin: 0
                anchors.leftMargin: 0
                anchors.bottomMargin: 0
                anchors.topMargin: 0

                Rectangle {
                    id: leftmenu
                    width: 70
                    color: "#121315"
                    anchors.left: parent.left
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    anchors.leftMargin: 0
                    anchors.bottomMargin: 0
                    anchors.topMargin: 0


                    PropertyAnimation{
                        id: animationMenu
                        target: leftmenu
                        property: "width"
                        to: if(leftmenu.width == 70) return 250; else return 70
                        duration: 1000
                        easing.type: Easing.OutBounce
                    }

                    Column {
                        id: columnMenus
                        width: 70
                        anchors.fill: parent
                        anchors.bottomMargin: 90

                        LeftMenuBtn {
                            id:btnHome
                            width: 70
                            text: qsTr("Home")
                            isActiveMenu: true
                            onClicked: {
                                btnHome.isActiveMenu = true
                                btnSegmentation.isActiveMenu = false
                                stackView.push(Qt.resolvedUrl("pages/homePage.qml"))
                            }


                        }

                        LeftMenuBtn {
                            id: btnSegmentation
                            width: 70
                            text: qsTr("Segmentation")
                            btnIconSource: "../images/svg_images/segmentation_icon.svg"
                            onClicked: {
                                btnHome.isActiveMenu = false
                                btnSegmentation.isActiveMenu = true
                                stackView.push(Qt.resolvedUrl("pages/segmentationPage.qml"))
                            }
                        }

                        LeftMenuBtn {
                            id: btnTrain
                            width: 70
                            text: qsTr("Train")
                            btnIconSource: "../images/svg_images/train1_icon.svg"
                        }
                    }
                }

                Rectangle {
                    id: contentPages
                    color: "#1c1d20"
                    anchors.left: leftmenu.right
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    clip: true
                    anchors.rightMargin: 0
                    anchors.topMargin: 0
                    anchors.bottomMargin: 25
                    anchors.leftMargin: 0

                    StackView {
                        id: stackView
                        anchors.fill: parent
                        initialItem: Qt.resolvedUrl("pages/homePage.qml")
                    }
                }

                Rectangle {
                    id: bottomContent
                    color: "#121315"
                    anchors.left: leftmenu.right
                    anchors.right: parent.right
                    anchors.top: contentPages.bottom
                    anchors.bottom: parent.bottom
                    anchors.leftMargin: 0
                    anchors.topMargin: 0

                    Label {
                        id: bottomDescription
                        color: "#ffffff"
                        text: qsTr("Bottom Description")
                        anchors.fill: parent
                        anchors.rightMargin: 30
                        anchors.leftMargin: 10
                        font.pointSize: 7
                    }
                    MouseArea {
                                           id: resizeWindow
                                           x: 884
                                           y: 0
                                           width: 25
                                           height: 25
                                           opacity: 0.5
                                           anchors.right: parent.right
                                           anchors.bottom: parent.bottom
                                           anchors.bottomMargin: 0
                                           anchors.rightMargin: 0
                                           cursorShape: Qt.SizeFDiagCursor

                                           DragHandler{
                                               target: null
                                               onActiveChanged: if (active){
                                                                    mainWindow.startSystemResize(Qt.RightEdge | Qt.BottomEdge)
                                                                }
                                           }

                                           Image {
                                               id: resizeImage
                                               width: 16
                                               height: 16
                                               anchors.fill: parent
                                               source: "../images/svg_images/resize_icon.svg"
                                               anchors.leftMargin: 5
                                               anchors.topMargin: 5
                                               sourceSize.height: 16
                                               sourceSize.width: 16
                                               fillMode: Image.PreserveAspectFit
                                               antialiasing: false
                                           }

                    }
                }
            }
        }
    }


    DropShadow{
        anchors.fill: background
        horizontalOffset: 0
        verticalOffset: 0
        radius: 10
        samples: 16
        color: "#80000000"
        source: background
        z: 0
    }
    MouseArea {
           id: resizeLeft
           width: 10
           anchors.left: parent.left
           anchors.top: parent.top
           anchors.bottom: parent.bottom
           anchors.leftMargin: 0
           anchors.bottomMargin: 10
           anchors.topMargin: 10
           cursorShape: Qt.SizeHorCursor

           DragHandler{
               target: null
               onActiveChanged: if (active) { mainWindow.startSystemResize(Qt.LeftEdge) }
           }
       }

       MouseArea {
           id: resizeRight
           width: 10
           anchors.right: parent.right
           anchors.top: parent.top
           anchors.bottom: parent.bottom
           anchors.rightMargin: 0
           anchors.bottomMargin: 10
           anchors.topMargin: 10
           cursorShape: Qt.SizeHorCursor

           DragHandler{
               target: null
               onActiveChanged: if (active) { mainWindow.startSystemResize(Qt.RightEdge) }
           }
       }

       MouseArea {
           id: resizeBottom
           height: 10
           anchors.left: parent.left
           anchors.right: parent.right
           anchors.bottom: parent.bottom
           anchors.rightMargin: 10
           anchors.leftMargin: 10
           anchors.bottomMargin: 0
           cursorShape: Qt.SizeVerCursor

           DragHandler{
               target: null
               onActiveChanged: if (active) { mainWindow.startSystemResize(Qt.BottomEdge) }
           }
       }
}

/*##^##
Designer {
    D{i:0;formeditorZoom:0.9}
}
##^##*/
