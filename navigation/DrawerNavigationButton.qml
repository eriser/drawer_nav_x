// ekke (Ekkehard Gentz) @ekkescorner
import QtQuick 2.6
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.0
import QtQuick.Controls.Material 2.0
import QtGraphicalEffects 1.0
import "../common"

ToolButton {
    id: myButton
    property bool isActive: index == navigationIndex
    property string myIconFolder: iconFolder
    Layout.fillWidth: true
    Layout.alignment: Qt.AlignHCenter
    focusPolicy: Qt.NoFocus
    height: 48
    width: myBar.width

    // Material.buttonPressColor
    Rectangle {
        visible: highlightActiveNavigationButton && myButton.isActive
        height: myButton.height
        width: myButton.width
        color:  Material.listHighlightColor
    }

    Row {
        spacing: 0
        topPadding: 0
        leftPadding: 16
        rightPadding: 16
        anchors.verticalCenter: parent.verticalCenter
        Item {
            anchors.verticalCenter: parent.verticalCenter
            width: 24 + 32
            height: 24
            Image {
                id: myImage
                width: 24
                height: 24
                horizontalAlignment: Image.AlignLeft
                anchors.verticalCenter: parent.verticalCenter
                source: "qrc:/images/"+myIconFolder+"/"+modelData.icon
                opacity: isActive? myBar.activeOpacity : myBar.inactiveOpacity
            }
            ColorOverlay {
                id: colorOverlay
                visible: myButton.isActive
                anchors.fill: myImage
                source: myImage
                color: primaryColor
            }
        } // image and coloroverlay
        Label {
            anchors.verticalCenter: parent.verticalCenter
            text: modelData.name
            opacity: 0.87 // isActive? 1.0 : 0.7
            color: isActive? primaryColor : dividerColor // flatButtonTextColor
            font.pixelSize: 14
            font.weight: Font.Medium
        } // label
    } // row
    onClicked: {
        navigationIndex = index
        navigationBar.close()
    }
} // myButton
