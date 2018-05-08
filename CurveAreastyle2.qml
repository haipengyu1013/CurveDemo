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

            ctx.moveTo(point[0].x, point[0].y);

            if(!curveStyle) {
                for(var i = 0 ; i < point.length - 1 ; ++i) {
                    ctx.lineTo(point[i + 1].x , point[i + 1].y)
                }
            } else {
                for(var i = 0 ; i < point.length - 1 ; ++i) {
                    var tmp = getCtrlPoint(point , i , 0.25 , 0.25)
                    ctx.bezierCurveTo(tmp.p1.x , tmp.p1.y, tmp.p2.x, tmp.p2.y, point[i + 1].x, point[i + 1].y);
                    ctx.moveTo(point[i + 1].x , point[i + 1].y)
                }
            }


            ctx.stroke()
            ctx.closePath()
        }
    }

    function getCtrlPoint(ps, i, a, b){

        if(!a||!b){
            a=0.25;
            b=0.25;
        }

        var x1
        var y1
        var x2
        var y2

        if(i == 0 ) {
            x1 = ps[i].x + (ps[i+1].x-ps[i].x)*a;
            y1 = ps[i].y + (ps[i+1].y-ps[i].y)*a;
            x2 = ps[i+1].x - (ps[i+2].x-ps[i].x)*b;
            y2 = ps[i+1].y - (ps[i+2].y-ps[i].y)*b;
        } else if( i > ps.length - 3) {
            var last= ps.length -1
            x1 = ps[i].x + (ps[last].x-ps[i-1].x)*a;
            y1 = ps[i].y + (ps[last].y-ps[i-1].y)*a;
            x2 = ps[last].x - (ps[last].x-ps[i].x)*b;
            y2 = ps[last].y - (ps[last].y-ps[i].y)*b;
        } else {
            x1 = ps[i].x + (ps[i+1].x-ps[i-1].x)*a;
            y1 = ps[i].y + (ps[i+1].y-ps[i-1].y)*a;
            x2 = ps[i+1].x - (ps[i+2].x-ps[i].x)*b;
            y2 = ps[i+1].y - (ps[i+2].y-ps[i].y)*b;
        }

        return {
            p1:{x:x1,y:y1},
            p2:{x:x2,y:y2}
        }
    }
}
