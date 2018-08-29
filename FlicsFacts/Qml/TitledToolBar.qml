import QtQuick 2.9
import QtQuick.Layouts 1.3
import QtQuick.Window 2.3
import QtQuick.Controls 2.2
import com.twentysixapps.flicsfacts2.constants 1.0
import "../fam"

ToolBar {
    id: titleToolBarId
    property string pageTitle: MovieViewManager.appName
    ToolButton {
        id: backToolButtonId
        visible: true
        anchors.left: parent.left
        anchors.leftMargin: textBorderWidth
        contentItem: Text {
            text: Constants.backChar
            color: "white"
            font.pixelSize: fontSizeXLarge
            horizontalAlignment: Image.AlignHCenter
            verticalAlignment: Image.AlignVCenter
        }
        onClicked: onBackSelected()
    }
    Label {
        text: pageTitle
        color: "white"
        font.pixelSize: fontSizeXLarge
        anchors.centerIn: parent
    }
}
