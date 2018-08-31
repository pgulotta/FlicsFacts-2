import QtQuick 2.9
import QtQuick.Layouts 1.3
import QtQuick.Window 2.3
import QtQuick.Controls 2.2
import QtQuick.Particles 2.0
import com.twentysixapps.flicsfacts2.constants 1.0

Page {
    id: mainPageId
    property int animationDuration: 1000
    property int emiitterSize: 64
    property real emitterSizeVariation: emiitterSize * .5
    signal menuSelected(string contextId, bool isClosed)
    signal buttonSelected(string contextId, int modelIndex)

    header: ToolBar {
        id: mainToolBarId
        ToolButton {
            id: mainToolButtonId
            visible: true
            anchors.left: parent.left
            anchors.leftMargin: textBorderWidth
            contentItem: Text {
                text: Constants.menuChar
                color: Constants.defaultTextColor
                font.pointSize: fontSizeLarge
                horizontalAlignment: Image.AlignHCenter
                verticalAlignment: Image.AlignVCenter
            }
            onClicked: mainDrawerId.open()
        }

        Label {
            text: MovieViewManager.appName
            color: Constants.defaultTextColor
            font.pointSize: fontSizeLarge
            anchors.centerIn: parent
        }
    }

    Image {
        id: mainPaneImageId
        width: isPortraitMode ? windowWidth * .65 : windowHeight * .60
        height: width
        anchors.centerIn: parent
        fillMode: Image.PreserveAspectFit
        source: "qrc:/Images/splash.png"
        opacity: 0
        TextLabel {
            id: mainPaneTextId
            text: MovieViewManager.appNameVersion
            anchors.bottomMargin: spacingIndent
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            anchors.right: parent.right
            horizontalAlignment: "AlignHCenter"
            opacity: 0
        }
        ParallelAnimation {
            running: true
            ScaleAnimator {
                target: mainPaneTextId
                from: 2.5
                to: 1.0
                duration: animationDuration
            }
            ScaleAnimator {
                target: mainPaneImageId
                from: 2.5
                to: 1.0
                duration: animationDuration
            }
            NumberAnimation {
                targets: [mainPaneImageId, mainPaneTextId]
                property: "opacity"
                from: 0.0
                to: 1.0
                duration: animationDuration
            }
        }
    }
    ParticleSystem {
        anchors.fill: parent
        ImageParticle {
            anchors.fill: parent
            source: "qrc:///particleresources/star.png"
            color: "indigo"
            blueVariation: 0.5
        }

        Emitter {
            emitRate: 32
            lifeSpan: 3000
            size: emiitterSize
            sizeVariation: emitterSizeVariation
            velocity: PointDirection {
                y: 0
                yVariation: -emitterSizeVariation
            }
            x: 0
            width: windowWidth
            height: windowHeight
        }
    }
}
