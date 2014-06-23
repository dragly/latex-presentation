// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 2.2
import LatexPresentation 1.0

Image {
    property string text: "No text specified"
    property string color: parent.textColor != undefined ? parent.textColor : "black"
    property bool forceCompile: false
    property bool centered: true
    property int dpi: 600

//    height: width * sourceSize.height / sourceSize.width
    smooth: true
    sourceSize.width: 1200
    sourceSize.height: 1200
    fillMode: Image.PreserveAspectFit

    Component.onCompleted: {
        var latexText = text
        var imageFileName = latexRunner.createFormula(latexText, color, centered)
        source = imageFileName
    }

    LatexRunner {
        id: latexRunner
        dpi: parent.dpi
        forceCompile: parent.forceCompile
    }
}
