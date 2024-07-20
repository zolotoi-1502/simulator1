import QtQuick.Window 2.14

import QtQuick 2.14
import QtQuick.Controls 2.14
import QtQuick.Layouts 1.14
import QtQml.Models 2.12

import MyCounter 1.0



Rectangle {


    id: windowmain

    width: 800
    height: 600

    property var objectsArray: []

    property int pinCountMicrobe:0
    property  string iddevice:"M"

    property var spriteMicrob;


    function generateRandomNumber(min, max) {
        return Math.floor(Math.random() * (max - min) + min)
    }

    function release(objectToDelete){
        console.log("A dynamic object is deleted");
console.log(objectToDelete.pinCount);
     //   if(objectToDelete!==null)
            objectToDelete.destroy(200);
    }

    ObjectModel{
        id:listobjects

    }


    Flow{
        id: flow1
        width: windowmain.width*0.75
        height: windowmain.height*0.8
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.topMargin: 0
        anchors.leftMargin: 0
        layer.mipmap: true
        spacing: 5



    }

    Flow {
        id: flow3
        y: 524
        width: windowmain.width*0.7
        height: 60
        anchors.left: parent.left
        anchors.bottom: parent.bottom
        spacing: 20
        anchors.bottomMargin: 16
        anchors.leftMargin: 8

        Label {
            id: label11
            width: 71
            height: 14
             text: qsTr("Кольчество микробов:")
            wrapMode: Text.WordWrap
            font.pointSize: 7
        }

        Label {
            id: label6
            width: 71
            height: 14

            text: flow1.children.length

            wrapMode: Text.WordWrap
            font.pointSize: 7
        }

        Label {
            id: label12
            x: 342
            width: 71
            height: 14

            text: qsTr("Удалил антибиотик:")
            wrapMode: Text.WordWrap
            font.pointSize: 7
        }

        Label {
            id: label7
            width: 71
            height: 14
            text: "0"
            wrapMode: Text.WordWrap
            font.pointSize: 7
        }
    }

    Flow {
        id: flow2
        x: 600
        y: 0
        anchors.left: parent.right
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: -200
        anchors.rightMargin: 0
        anchors.bottomMargin: 0
        anchors.topMargin: 0

        SettingsMicrobe{
            id: settingsMicrobe

        }

        Button {
            id: button
            width: 44
            height: 40
            text: qsTr("Add")
            anchors.left: parent.left
            anchors.leftMargin: 0
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 0
            onClicked:{//count++
                for(var i=0;i<settingsMicrobe.countmicrob;i++)
                {
spriteMicrob=newmicrob.createObject(flow1,{
                                        "id":i,
                                        "namezone":"микроб_"+i,
                                        "lifetimemicrob": settingsMicrobe.lifetimemicrob,
                                        "childtimemicrob": settingsMicrobe.childtimemicrob,
                                        "pinCount":i




                                    });
                    listobjects.append(spriteMicrob);


                }
            }
        }

        Button {
            id: button2
            width: 44
            height: 40
            text: qsTr("Delete")
            anchors.left: parent.left
            anchors.leftMargin: 50
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 0
            onClicked:{//count++
                var randanti=generateRandomNumber(0, settingsMicrobe.antibioticmicrob)
var percentM=(flow1.children.length)*randanti/100
                label7.text=Math.round(percentM)
                for(var i=0;i<percentM;i++)
                {


flow1.children[i].destroy()


                }
            }
        }
    }

    Component{
        id:newmicrob

        Microbe{
            namezone:"микроб_"
        }
    }















}
