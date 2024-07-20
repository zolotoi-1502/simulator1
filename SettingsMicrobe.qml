import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Extras 1.4
import QtQuick.Dialogs 1.2
import QtQuick.Window 2.2


Rectangle {
    id:rootsetting
    property real lifetimemicrob: dial.value
    property real childtimemicrob: dial1.value
    property real countmicrob: dial2.value
    property real antibioticmicrob: dial3.value

    width: 200

    height: 350


    color: "#c2ffffff"
    radius: 5
    border.width: 2



Label {
    id: label
    x: 4
    y: 8
    width: 96
    height: 27
    text: "Настройка"
    font.bold: true
    font.pointSize: 12

}

Label {
    id: label8
    x: 4
    y: 107
    width: 96
    height: 14
    text: qsTr("время до потомства:")
    wrapMode: Text.WordWrap
    font.pointSize: 7
}

Label {
    id: label9
    x: 4
    y: 33
    width: 71
    height: 14
    text: qsTr("время жизни:")
    wrapMode: Text.WordWrap
    font.pointSize: 7
}

Dial {
    id: dial
    x: 20
    y: 48
    width: 55
    height: 48
    value: 12
    tickmarksVisible: true
    stepSize: 1
    maximumValue: 60
}

Dial {
    id: dial1
    x: 20
    y: 127
    width: 55
    height: 48
    value: 7
    stepSize: 1
    maximumValue: 60
    tickmarksVisible: true
}

Label {
    id: label10
    x: 4
    y: 181
    width: 71
    height: 14
    text: qsTr("Количество:")
    wrapMode: Text.WordWrap
    font.pointSize: 7
}

Dial {
    id: dial2
    x: 20
    y: 201
    width: 55
    height: 48
    value: 20
    stepSize: 1
    maximumValue: 30
    tickmarksVisible: true
}

Label {
    id: label11
    x: 4
    y: 260
    width: 104
    height: 14
    text: qsTr("Антибиотик Количество:")
    wrapMode: Text.WordWrap
    font.pointSize: 7
}

Dial {
    id: dial3
    x: 20
    y: 280
    width: 55
    height: 48
    value: 30
    stepSize: 1
    maximumValue: 100
    tickmarksVisible: true
}

Label {
    id: label12
    x: 114
    y: 33
    width: 71
    height: 14
    text: lifetimemicrob//dial.value
    wrapMode: Text.WordWrap
    font.pointSize: 7
}

Label {
    id: label13
    x: 114
    y: 107
    width: 71
    height: 14
    text: childtimemicrob//dial1.value
    wrapMode: Text.WordWrap
    font.pointSize: 7
}

Label {
    id: label14
    x: 114
    y: 181
    width: 71
    height: 14
    text: countmicrob//dial2.value
    wrapMode: Text.WordWrap
    font.pointSize: 7
}

Label {
    id: label15
    x: 114
    y: 260
    width: 71
    height: 14
    text: antibioticmicrob//dial3.value
    wrapMode: Text.WordWrap
    font.pointSize: 7
}


}
