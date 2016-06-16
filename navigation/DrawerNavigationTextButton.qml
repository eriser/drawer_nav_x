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
