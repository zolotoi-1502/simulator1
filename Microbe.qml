import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Extras 1.4
import QtQuick.Dialogs 1.2
import QtQuick.Window 2.2
import QtQuick.Layouts 1.3
import QtQml.Models 2.12
import MyCounter 1.0

Rectangle {
    id:root
    objectName: namezone+pinCount
    property string namezone: "Имя зоны"+pinCount.toString()
    property bool statusLife: false
    property int pinCount:0
    property int pinCountChild:pinCount+1

    property  string iddevice:"M"+pinCount
    property real lifetimemicrob: 10
    property real childtimemicrob: 5

    property real lifetimemicrob1: lifetimemicrob
    property real childtimemicrob1: childtimemicrob


    property real value : lifetimemicrob
    property bool operationInProgress: false
    property var spriteSRV;

    width: 100
    height: 100
    color: "#c2ffffff"
    radius: 5
    border.width: 2

MyCounter{
id:myCounter

value: 0

onValueChanged:{
label11.text= myCounter.value
}


}



    Component.onCompleted: {
        }







            Timer{
                   id:timer_1
                   interval: 1000
                   repeat: true
                   running: true
                   triggeredOnStart: true //START () trigger
                   onRunningChanged:  {

                       operationInProgress = true


                   }
                   onTriggered: {//trigger

                       console.log(lifetimemicrob.toString())

                       lifetime.text=lifetimemicrob1
                       childtime1.text=childtimemicrob1
                       if(lifetimemicrob1==0 && childtimemicrob1>0){

                           lifetimemicrob1=lifetimemicrob

                           myCounter.threadDestroy()

                          parent.destroy()
                   }else if(lifetimemicrob1==0 && childtimemicrob1==0){

                           spriteMicrob=newmicrob.createObject(flow1,{
                                                                   "id":pinCount+"_"+pinCountChild,
                                                                   "namezone":"микроб_"+pinCountChild,
                                                                   "lifetimemicrob": lifetimemicrob,
                                                                   "childtimemicrob": childtimemicrob,
                                                                   "pinCount":pinCountChild
                                                               });

                           myCounter.threadDestroy()

                           parent.destroy()

                       }
                        else
                           lifetimemicrob1--
                        if(lifetimemicrob1>0 && childtimemicrob1==0){

                            spriteMicrob=newmicrob.createObject(flow1,{
                                                                    "id":pinCountChild,
                                                                    "namezone":"микроб_"+pinCountChild,

                                                                    "lifetimemicrob": lifetimemicrob,
                                                                    "childtimemicrob": childtimemicrob,
                                                                    "pinCount":pinCountChild
                                                                });
                                          listobjects.append(spriteMicrob);

                            childtimemicrob1=childtimemicrob
                        }else
                            childtimemicrob1--
                   }
               }
Label {
    id: label
    x: 4
    y: 8
    width: 96
    height: 27
    text: qsTr(namezone)
    font.bold: true
    font.pointSize: 12

}

Label {
    id: label8
    x: 4
    y: 53
    width: 71
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

Label {
    id: lifetime
    x: 79
    y: 33
    width: 71
    height: 14
    text: qsTr("0")
    wrapMode: Text.WordWrap
    font.pointSize: 7
}

Label {
    id: childtime1
    x: 79
    y: 53
    width: 71
    height: 14
    text: qsTr("0")
    wrapMode: Text.WordWrap
    font.pointSize: 7
}



}
