import QtQuick 2.9
import QtQuick.Window 2.2

Window {
    visible: true
    width: 1200
    height: 480
    title: qsTr("Hello World")
    id: window
    property var pointX: []
    property var pointY: []

    property var point: []

    Component.onCompleted: {
        for( var i = 0 ; i < 50 ; ++i ) {
            pointX[i] = Math.floor( 40 * i + Math.random() * 40 )
            pointY[i] = Math.floor( Math.random() * 300 )
            point.push({x:pointX[i],y:pointY[i]})
//            window.point[i].x = pointX[i]
//            window.point[i].y = pointY[i]
        }
    }





    Item {
        width: window.width
        height: 500
        CurveArea {
            curveStyle: true
            colorname: "blue"

        }
    }

    Item {
        width: window.width
        height: 500
        CurveAreastyle2 {
            curveStyle: true
            colorname: "yellow"

        }
    }

    Item {
        width: window.width
        height: 500
        CurveArea {
            colorname: "red"
        }
    }

}
