import QtQuick 2.9
import QtQuick.Layouts 1.3
import QtQuick.Window 2.3
import QtQuick.Controls 2.2
import com.twentysixapps.flicsfacts2.constants 1.0

Drawer {
    id: mainDrawerId
    width: isPortraitMode ? rootId.width * .7 : rootId.width * .4
    height: rootId.height

    Component {
        id: headerId
        Rectangle {
            width: parent.width
            height: width / 2

            gradient: Gradient {
                GradientStop {
                    position: 0.00
                    color: Constants.primaryColor
                }
                GradientStop {
                    position: 0.50
                    color: "#bfbff2"
                }
                GradientStop {
                    position: 1.00
                    color: Constants.primaryColor
                }
            }
            TitleLabel {
                text: MovieViewManager.appName
                anchors.centerIn: parent
                color: Constants.primaryColor
                font.pointSize: fontSizeLarge
            }
        }
    }

    ListView {
        id: drawerListViewId
        currentIndex: -1
        anchors.fill: parent
        header: headerId
        focus: true

        delegate: ItemDelegate {
            width: parent.width
            text: model.title
            font.pointSize: fontSizeMedium
            highlighted: false
            onClicked: {
                if (drawerListViewId.currentIndex != index) {
                    drawerListViewId.currentIndex = index
                    stackViewId.push(model.source)
                }
                drawerListViewId.currentIndex = -1
                mainDrawerId.close()
            }
        }
        model: ListModel {
            ListElement {
                title: qsTr("Movie Search")
                source: "qrc:/Qml/MovieResponsePage.qml"
            }
            ListElement {
                title: qsTr("Movies Now Playing")
                source: "qrc:/Qml/NowPlayingMoviesPage.qml"
            }
            ListElement {
                title: qsTr("Upcoming Movies")
                source: "qrc:/Qml/UpcomingMoviesPage.qml"
            }
            ListElement {
                title: qsTr("About")
                source: "qrc:/Qml/AboutPage.qml"
            }
        }

        ScrollIndicator.vertical: ScrollIndicator {}
    }
}
