import QtQuick 2.9
import QtQuick.Layouts 1.3
import QtQuick.Window 2.3
import QtQuick.Controls 2.2

ApplicationWindow {
    readonly property bool isAndroidPlatform: Qt.platform.os === "android"
    readonly property int textHeight: 42
    readonly property int columnItemIndent: 100
    readonly property int textBorderWidth: 2
    readonly property int textMargin: 8
    readonly property int spacingIndent: 20
    readonly property int fontSizeXLarge: 20
    readonly property int fontSizeLarge: 18
    readonly property int fontSizeMedium: 16
    readonly property int fontSizeSmall: 14
    readonly property string primaryColor: "DarkSlateBlue"
    readonly property string accentColor: "MediumSlateBlue"
    readonly property string foregroundColor: "Indigo"
    readonly property string backgroundColor: "Lavender"
    readonly property string tmdbLink: "http://www.themoviedb.org/"
    readonly property string qtLink: "http://www.qt.io/"
    readonly property string websiteLink: "http://sites.google.com/view/flicsfacts/home"

    property bool isPortraitMode: Screen.height > Screen.width
    property int windowWidth: isAndroidPlatform ? Screen.width : Screen.width / 3
    property int windowHeight: isAndroidPlatform ? Screen.height : Screen.height / 3

    id: rootId
    visible: true
    minimumWidth: windowWidth
    minimumHeight: windowHeight
    color: backgroundColor
    title: MovieViewManager.appNameVersion

    MainDrawer {
        id: mainDrawerId
    }

    StackView {
        id: stackViewId
        state: ""
        anchors.fill: parent
        initialItem: MainPage {
        }
    }

    function onBackSelected() {
        stackViewId.pop()
    }
}
