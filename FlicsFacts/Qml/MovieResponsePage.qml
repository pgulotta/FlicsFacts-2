import QtQuick 2.9
import QtQuick.Layouts 1.3
import QtQuick.Window 2.3
import QtQuick.Controls 2.2
import com.twentysixapps.flicsfacts2.constants 1.0
import "../fam"

Page {
  id: movieSearchPageId
  property alias movieIndex: movieSwipeViewId.currentIndex

  header: MovieSearchToolBar {
    id: movieSearchToolBarId
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
    onCurrentIndexChanged: MovieViewManager.tryQueryMovieSearch(currentIndex)
  }
  PageIndicator {
    count: movieSwipeViewId.count
    currentIndex: movieSwipeViewId.currentIndex
    anchors.bottom: parent.bottom
    anchors.horizontalCenter: parent.horizontalCenter
  }

  FloatingActionMenu {
    id: famShareId
    visible: movieSearchResponses.count !== 0
    famIconColor: Constants.foregroundColor
    famImage: "qrc:/Images/more.png"
    labelWidth: famLabelWidth
    famLabelBackColor: Constants.defaultTextColor
    onButtonItemSelected: {
      switch (modelIndex) {
      case 0:
        MovieViewManager.removeSelectedMovie(movieIndex)
        if (movieIndex === -1)
          movieIndex = 0
        break
      case 1:
        MovieViewManager.removeAllMovieSearchResponses()
        break
      case 2:
        MovieViewManager.shareMovieResponses()
        break
      default:
        console.log("In onButtonItemSelected, model error is unknown")
        break
      }
    }

    floatingActionButtons: isAndroidPlatform ? androidfloatingActionButtons : noAndroidfloatingActionButtons
  }

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

  ListModel {
    id: noAndroidfloatingActionButtons
    ListElement {
      description: qsTr("Remove Current Movie Search Result")
      iconUrl: "qrc:/Images/remove.png"
      iconColor: "indigo"
    }
    ListElement {
      description: qsTr("Remove All Movie Search Results")
      iconUrl: "qrc:/Images/deleteall.png"
      iconColor: "indigo"
    }
  }

  ListModel {
    id: androidfloatingActionButtons
    ListElement {
      description: qsTr("Remove Current Movie Search Result")
      iconUrl: "qrc:/Images/remove.png"
      iconColor: "indigo"
    }
    ListElement {
      description: qsTr("Remove All Movie Search Results")
      iconUrl: "qrc:/Images/deleteall.png"
      iconColor: "indigo"
    }
    ListElement {
      description: qsTr("Share All Movie Searches")
      iconUrl: "qrc:/Images/share.png"
      iconColor: "indigo"
    }
  }
}
