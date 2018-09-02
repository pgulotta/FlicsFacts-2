import QtQuick 2.9
import QtQuick.Layouts 1.3
import QtQuick.Window 2.3
import QtQuick.Controls 2.2

import "../fam"

Page {
    id: movieSearchPageId
    property alias movieIndex: movieSwipeViewId.currentIndex

    header: MovieSearchToolBar {
        id: movieSearchToolBarId
        onMovieRemoved: {
            console.log(indexRemoved)
            if (indexRemoved === -1)
                movieIndex = 0
        }
    }
    Component.onCompleted: MovieViewManager.tryQueryMovieSearch(0)

    SwipeView {
        id: movieSwipeViewId
        anchors.fill: parent
        currentIndex: 0
        Repeater {
            id: movieResponseModelId
            model: movieSearchResponses
            delegate: MovieResponseDelegate {
            }
        }
        onCurrentIndexChanged: MovieViewManager.tryQueryMovieSearch(
                                   currentIndex)
    }
    PageIndicator {
        count: movieSwipeViewId.count
        currentIndex: movieSwipeViewId.currentIndex
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
    }

    //    FloatingActionMenu {
    //        id: famShareId
    //        visible: movieSearchResponses.count !== 0
    //        famIconColor: "indigo"
    //        famImage: "qrc:/Images/more.png"
    //        labelWidth: 180
    //        famLabelBackColor: "white"
    //        onButtonItemSelected: {
    //            switch (modelIndex) {
    //            case 0:
    //                MovieViewManager.shareMovieResponses()
    //                break
    //            case 1:
    //                MovieViewManager.removeAllMovieSearchResponses()
    //                break
    //            default:
    //                console.log("In onButtonItemSelected, model error is unknown")
    //                break
    //            }
    //        }

    //        floatingActionButtons: ListModel {
    //            ListElement {
    //                description: qsTr("Share All Movies")
    //                iconUrl: "qrc:/Images/share.png"
    //                iconColor: "indigo"
    //            }
    //            ListElement {
    //                description: qsTr("Remove Movie Searches")
    //                iconUrl: "qrc:/Images/deleteall.png"
    //                iconColor: "indigo"
    //            }
    //        }
    //    }
    Connections {
        target: MovieViewManager
        onResponseReceived: {
            movieSwipeViewId.currentIndex = responseId
        }
    }
    Connections {
        target: MovieViewManager
        onDisplayTextMessage: messagePopupId.show(title, message)
    }

    MessagePopup {
        id: messagePopupId
    }
}
