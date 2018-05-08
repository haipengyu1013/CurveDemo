import QtQuick 2.0

Item {
    anchors.fill: parent

    property var points: {["1" , "2"]}
    property bool curveStyle: false
    property string colorname: "red"
    Component.onCompleted: {

    }

    Canvas {
        anchors.fill: parent
        onPaint: {
            var ctx = getContext("2d");

            ctx.lineWidth = 10
            ctx.strokeStyle = colorname
            ctx.beginPath()

            ctx.moveTo(pointX[0], pointY[0]);

            if(!curveStyle) {
                for(var i = 0 ; i < 49 ; ++i) {
                    ctx.lineTo(pointX[i + 1] , pointY[i + 1])
                }
            } else {
                for(var i = 0 ; i < 30 ; ++i) {

                    ctx.bezierCurveTo((pointX[i] + pointX[i + 1]) / 2 , pointY[i], (pointX[i] + pointX[i + 1]) / 2, pointY[i + 1], pointX[i + 1], pointY[i + 1]);
                    ctx.moveTo(pointX[i + 1] , pointY[i + 1])
                }
            }

            //            ctx.bezierCurveTo(100, 500, 300, 100, 600, 500);

            ctx.stroke()
            ctx.closePath()
        }
    }
}

//import QtQuick 2.0

//Item {
//    anchors.fill: parent

//    property var points: {["1" , "2"]}
//    property bool curveStyle: false
//    property string colorname: "red"
//    Component.onCompleted: {

//    }

//    Canvas {
//        anchors.fill: parent
//        onPaint: {
//            var ctx = getContext("2d");

//            ctx.lineWidth = 10
//            ctx.strokeStyle = colorname
//            ctx.beginPath()

//            ctx.moveTo(point[0].x, point[0].y);

//            if(!curveStyle) {
//                for(var i = 0 ; i < point.length - 1 ; ++i) {
//                    ctx.lineTo(point[i + 1].x , point[i + 1].y)
//                }
//            } else {
//                for(var i = 0 ; i < point.length - 1  ; ++i) {
//                    ctx.bezierCurveTo((point[i].x + point[i + 1].y) / 2 , point[i].y, (point[i].x + point[i + 1].y) / 2, point[i + 1].y, point[i + 1].x, point[i + 1].y);
//                    ctx.moveTo(point[i + 1].x , point[i + 1].y)
//                }
//            }

//            //            ctx.bezierCurveTo(100, 500, 300, 100, 600, 500);

//            ctx.stroke()
//            ctx.closePath()
//        }
//    }
//}
