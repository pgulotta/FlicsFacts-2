import QtQuick 2.9
import QtQuick.Layouts 1.3
import QtQuick.Window 2.3
import QtQuick.Controls 2.2
import com.twentysixapps.flicsfacts2.constants 1.0

ApplicationWindow {
    readonly property bool isAndroidPlatform: Qt.platform.os === "android"
    readonly property int textHeight: dp(42)
    readonly property int columnItemIndent: dp(100)
    readonly property int textBorderWidth: dp(2)
    readonly property int textMargin: dp(8)
    readonly property int spacingIndent: dp(20)
    readonly property int fontSizeLarge: dp(20)
    readonly property int fontSizeMedium: dp(18)
    readonly property int fontSizeSmall: dp(16)

    readonly property string tmdbLink: "http://www.themoviedb.org/"
    readonly property string qtLink: "http://www.qt.io/"
    readonly property string websiteLink: "http://sites.google.com/view/flicsfacts/home"

    property bool isPortraitMode: Screen.height > Screen.width
    property int windowWidth: isAndroidPlatform ? Screen.width : Screen.width * 0.4
    property int windowHeight: isAndroidPlatform ? Screen.height : Screen.height * 0.8
    //  property int windowWidth: isAndroidPlatform ? Screen.width : Screen.width * 0.5
    //  property int windowHeight: isAndroidPlatform ? Screen.height : Screen.height * 0.5
    property int famLabelWidth: isPortraitMode ? windowWidth * 0.7 : windowWidth * 0.4

    id: rootId
    visible: true
    minimumWidth: windowWidth
    minimumHeight: windowHeight
    color: Constants.backgroundColor
    title: MovieViewManager.appNameVersion
    font.pointSize: fontSizeLarge
    font.bold: true

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

    function dp(x) {
        return (Screen.pixelDensity * 25.4 < 120) ? x : x * (Screen.pixelDensity * 25.4 / 160)
    }
}
