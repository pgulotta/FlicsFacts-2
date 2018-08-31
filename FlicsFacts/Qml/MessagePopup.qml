import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Window 2.3
import com.twentysixapps.flicsfacts2.constants 1.0

Popup {
    id: messagePopupId
    modal: true
    background: backgroundRectId
    x: isPortraitMode ? windowWidth * .1 : windowWidth * .35
    y: windowHeight * .15
    width: isPortraitMode ? windowWidth * .8 : windowWidth * .4
    height: isPortraitMode ? windowHeight * .25 : windowHeight * .3
    readonly property int closeTimerDuration: 2500
    property string titleText: MovieViewManager.appName
    property string messageText: ""

    function show(title, message) {
        titleText = title
        messageText = message
        messagePopupId.open()
        closeTimerId.restart()
    }

    Timer {
        id: closeTimerId
        interval: closeTimerDuration
        running: false
        onTriggered: {
            messagePopupId.close()
        }
    }
    Rectangle {
        id: backgroundRectId
        color: Constants.backgroundColor
    }

    MouseArea {
        height: parent.height
        width: parent.width
        onClicked: messagePopupId.close()
    }
    TitleLabel {
        id: titleTextId
        text: titleText
        anchors.top: messagePopupId.top
        anchors.topMargin: spacingIndent
    }

    TextLabel {
        id: messageTextId
        text: messageText
        width: messagePopupId.width * .8
        height: messagePopupId.height * .8
        anchors.top: titleTextId.bottom
        anchors.topMargin: spacingIndent
        anchors.left: titleTextId.left
        anchors.leftMargin: spacingIndent
        anchors.right: messagePopupId.right
        anchors.rightMargin: spacingIndent
    }
}
