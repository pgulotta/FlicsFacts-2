import QtQuick 2.9
import QtQuick.Layouts 1.3
import QtQuick.Window 2.3
import QtQuick.Controls 2.2


import "../fam"

Page {
    id: upcomingPageId

    header: TitledToolBar {
        pageTitle: qsTr("Upcoming Movies")
    }
    SwipeView {
        id: upcomingMoviesSwipeViewId
        anchors.fill: parent
        currentIndex: 0
        Repeater {
            id: upcoingMoviesModelId
            model: sortedUpcomingMoviesResponses
            delegate: MovieResponseDelegate {
            }
        }
    }
    PageIndicator {
        count: upcomingMoviesSwipeViewId.count
        currentIndex: upcomingMoviesSwipeViewId.currentIndex
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
    }

    Connections {
        target: MovieViewManager
        onResponseReceived: upcomingMoviesSwipeViewId.currentIndex = responseId
    }

    Component.onCompleted: MovieViewManager.queryUpcomongMovies()
}
