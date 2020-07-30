import QtQuick 2.0

Rectangle {
    id: root
    width: 120
    height: 240
    color:  "#D8D8D8"

    Image {
        id: rocket
        x: (parent.width - width) / 2
        y: 40
        source: "./logo@128_128.png"
    }

    Text {
        y: rocket.y + rocket.height + 20
        width:  root.width
        horizontalAlignment:  Text.AlignHCenter
        text: qsTr("Rocket")
    }
}
