import QtQuick 2.9
import QtQuick.Layouts 1.3
import QtQuick.Window 2.3
import QtQuick.Controls 2.2


import "../fam"

Page {
    id: movieResponsePageId

    header: TitledToolBar {
        pageTitle: qsTr("Movies Now Playing")
    }

    SwipeView {
        id: nowPlayingMoviesSwipeViewId
        anchors.fill: parent
        currentIndex: 0
        Repeater {
            id: movieResponseModelId
            model: sortedNowPlayingMoviesResponses
            delegate: MovieResponseDelegate {
            }
        }
    }
    PageIndicator {
        count: nowPlayingMoviesSwipeViewId.count
        currentIndex: nowPlayingMoviesSwipeViewId.currentIndex
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
    }

    Connections {
        target: MovieViewManager
        onResponseReceived: nowPlayingMoviesSwipeViewId.currentIndex = responseId
    }

    Component.onCompleted: MovieViewManager.queryNowPlayingMovies()
}
