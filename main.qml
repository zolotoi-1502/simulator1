import QtQuick.Window 2.14

import QtQuick 2.14
import QtQuick.Controls 2.14



ApplicationWindow {

    id: window
       visible: true
    width: 800
    height: 600
    title: qsTr("Симулятор")

  MainWind{
  id: windowmain
   anchors.fill: parent
  }


}
