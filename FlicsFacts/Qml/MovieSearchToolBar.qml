import QtQuick 2.9
import QtQuick.Layouts 1.3
import QtQuick.Window 2.3
import QtQuick.Controls 2.4
import com.twentysixapps.flicsfacts2.constants 1.0
import "../fam"

ToolBar {
    id: movieSearchToolBarId

    signal movieRemoved(int indexRemoved)

    Component.onCompleted: {
        titleRequestId.forceActiveFocus()
        Qt.inputMethod.hide()
    }

    ToolButton {
        id: backToolButtonId
        visible: true
        anchors.left: parent.left
        anchors.leftMargin: textBorderWidth
        contentItem: Text {
            text: Constants.backChar
            color: Constants.defaultTextColor
            font.pointSize: fontSizeLarge
            horizontalAlignment: Image.AlignHCenter
            verticalAlignment: Image.AlignVCenter
        }
        onClicked: onBackSelected()
    }
    Rectangle {
        id: searchTextRectId
        width: .5 * windowWidth
        radius: 4
        anchors.left: backToolButtonId.right
        anchors.leftMargin: textBorderWidth
        anchors.top: parent.top
        anchors.topMargin: textMargin
        anchors.bottom: parent.bottom
        anchors.bottomMargin: textMargin
        border.width: textBorderWidth
        border.color: Constants.accentColor
        TextField {
            id: titleRequestId
            height: textHeight
            focus: true
            placeholderText: qsTr("Movie Title")
            color: Constants.primaryColor
            font.pointSize: fontSizeSmall
            verticalAlignment: Text.AlignVCenter
            anchors.left: searchTextRectId.left
            anchors.leftMargin: textMargin
            anchors.right: searchTextRectId.right
            anchors.top: searchTextRectId.top
            anchors.topMargin: textBorderWidth
            Keys.onReturnPressed: {
                Qt.inputMethod.hide()
                processSearchRequest()
            }
            onFocusChanged: Qt.inputMethod.hide()
        }
    }
    RowLayout {
        id: searchButtonRowId
        anchors.left: searchTextRectId.right
        anchors.leftMargin: textBorderWidth
        ToolButton {
            id: searchButtonId
            Layout.maximumWidth: textHeight
            Layout.maximumHeight: textHeight
            contentItem: Image {
                fillMode: Image.PreserveAspectFit
                clip: true
                source: "qrc:/Images/search.png"
            }
            onClicked: {
                processSearchRequest()
                onFocusChanged: Qt.inputMethod.hide()
            }
        }
    }
    RowLayout {
        anchors.left: searchButtonRowId.right
        anchors.leftMargin: textBorderWidth
        visible: movieSearchResponses.count !== 0
        ToolButton {
            id: removeButtonId
            Layout.maximumWidth: textHeight
            Layout.maximumHeight: textHeight
            contentItem: Image {
                fillMode: Image.PreserveAspectFit
                clip: true
                source: "qrc:/Images/remove.png"
            }
            onClicked: {
                MovieViewManager.removeSelectedMovie(
                            movieSearchPageId.movieIndex)
                onFocusChanged: Qt.inputMethod.hide()
                movieRemoved(movieSearchPageId.movieIndex)
            }
        }
    }

    function processSearchRequest() {
        MovieViewManager.findFlicSelected(titleRequestId.text)
        titleRequestId.text = ""
    }
}
