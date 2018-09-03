import QtQuick 2.9
import QtQuick.Window 2.11
import QtQuick.Controls 2.1
import QtQuick.Layouts 1.1

Rectangle {
    id: fabLabelId
    Layout.preferredWidth: labelWidth
    Layout.preferredHeight: parent.height / 2
    radius: 6
    color: famLabelBackColor
    border.color: model.iconColor
    border.width: 2
    opacity: model.description === "" ? 0 : 1

    Label {
        text: model.description
        color: model.iconColor
        Layout.preferredWidth: fabLabelId.width
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        anchors.fill: parent
        elide: Text.ElideRight
        width: fabLabelId.width
        padding: descriptionPadding
        font.pixelSize: (Screen.pixelDensity * 25.4
                         < 120) ? 16 : 16 * (Screen.pixelDensity * 25.4 / 160)
    }
}
