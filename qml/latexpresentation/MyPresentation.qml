//import Qt.labs.presentation 1.0
import QtQuick 2.2
import LatexPresentation 1.0
//import QtMultimediaKit 1.1

TransitionPresentation
{
    id: myPresentation
    focus: true

    transitionTime: 500

    width: 800
    height: 600

    textColor: "black"

    Slide {
        title: "One-body density"
    }

    Slide {
        Latex {
            text: "Genetic Monte Carlo"
            color: "black"
            anchors.top: parent.top
            anchors.topMargin: parent.height / 3
            anchors.horizontalCenter: parent.horizontalCenter
            centered: true
            width: parent.width / 2
        }
    }

    Slide {
        title: "One-body density"
        Image {
            id: box
            width: parent.width * 0.7
            height: width * sourceSize.height / sourceSize.width
            source: "../../images/density-trim.png"
            anchors.centerIn: parent
            smooth: true

            MouseArea {
                id: mouse
                anchors.fill: parent
                drag.target: box
                onPressed: {
                    box.anchors.centerIn = undefined
                }
            }
        }
    }

    Slide {
        title: "We can even have tables"
        Latex {
            text: "Here comes a table!" +
                  "\\begin{table}" +
                  "\\begin{tabular}{ccc}" +
                  "     a & b & c \\\\" +
                  "     d & e & f \\\\" +
                  "     g & h & i \\\\" +
                  "\\end{tabular}" +
                  "\\end{table}"

            anchors.centerIn: parent
            centered: false
            width: parent.width / 2
        }
    }

    Slide {
        Latex {
            text: "The wave function $\\Psi$ is defined as $$\\Psi = \\Phi_0 \\Psi_J$$ where $\\Phi_0$ is the Slater determinant and $\\Psi_J$ the Jastrow factor"
            anchors.centerIn: parent
            centered: true
            width: parent.width
        }
    }

    Slide {
        title: "Standard bullet list"
        content: [
            "Please don't use this",
            "Bullets are so boring",
            "So why are you still reading?"
        ]
    }

// Example of QML Video element in Slide. You should uncomment the QGLWidget line in main.cpp
// and add a video of your choice to use this
//    Slide {
//        title: "Bonus: Video!"
//        Video {
//            id: myVideo
//            source: "../../videos/TerryMoore_2012.mp4"
//            width : parent.width
//            height : parent.height
//            anchors.centerIn: parent

//            MouseArea {
//                anchors.fill: parent
//                onClicked: {
//                    if(myVideo.paused) {
//                        myVideo.play()
//                    } else if(myVideo.playing) {
//                        myVideo.pause()
//                    } else {
//                        myVideo.play()
//                    }
//                }
//            }

//        }
//    }


}
