import QtQuick 2.9
import QtQuick.Window 2.3
pragma Singleton

QtObject {
    readonly property string questionChar: "\u003f"
    readonly property string backChar: "\u2190"
    readonly property string previousChar: "\u00AB"
    readonly property string nextChar: "\u00BB"
    readonly property string downChar: "\u21e3"
    readonly property string upChar: "\u21e1"
    readonly property string leftChar: "\u21e0"
    readonly property string rightChar: "\u21e2"
    readonly property string checkChar: "\u2713"
    readonly property string circleChar: "\u26aa"
    readonly property string refreshChar: "\u21bb"
    readonly property string menuChar: "\u2261"

    readonly property int animationDuration: 1100
    readonly property int invalidItem: -1
}
