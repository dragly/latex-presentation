// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import LatexPresentation 1.0

Image {
    property string text: "No text specified"
    property string color: parent.textColor != undefined ? parent.textColor : "black"
    property bool forceCompile: false
    property bool centered: true
    property int dpi: 600

    height: width * sourceSize.height / sourceSize.width
    smooth: true


    Component.onCompleted: {
        var latexText = text
//        latexText = latexText.replace(/\\a/g, "\\a")
//        latexText = latexText.replace(/\b/g, "\\b")
//        latexText = latexText.replace(/\c/g, "\\c")
//        latexText = latexText.replace(/\d/g, "\\d")
//        latexText = latexText.replace(/\e/g, "\\e")
//        latexText = latexText.replace(/\f/g, "\\f")
//        latexText = latexText.replace(/\g/g, "\\g")
//        latexText = latexText.replace(/\h/g, "\\h")
//        latexText = latexText.replace(/\i/g, "\\i")
//        latexText = latexText.replace(/\j/g, "\\j")
//        latexText = latexText.replace(/\k/g, "\\k")
//        latexText = latexText.replace(/\l/g, "\\l")
//        latexText = latexText.replace(/\m/g, "\\m")
//        latexText = latexText.replace(/\n/g, "\\n")
//        latexText = latexText.replace(/\o/g, "\\o")
//        latexText = latexText.replace(/\p/g, "\\p")
//        latexText = latexText.replace(/\q/g, "\\q")
//        latexText = latexText.replace(/\r/g, "\\r")
//        latexText = latexText.replace(/\s/g, "\\s")
//        latexText = latexText.replace(/\t/g, "\\t")
//        latexText = latexText.replace(/\u/g, "\\u")
//        latexText = latexText.replace(/\v/g, "\\v")
//        latexText = latexText.replace(/\w/g, "\\w")
//        latexText = latexText.replace(/\x/g, "\\x")
//        latexText = latexText.replace(/\y/g, "\\y")
//        latexText = latexText.replace(/\z/g, "\\z")
//        latexText = latexText.replace(/\A/g, "\\A")
//        latexText = latexText.replace(/\B/g, "\\B")
//        latexText = latexText.replace(/\C/g, "\\C")
//        latexText = latexText.replace(/\D/g, "\\D")
//        latexText = latexText.replace(/\E/g, "\\E")
//        latexText = latexText.replace(/\F/g, "\\F")
//        latexText = latexText.replace(/\G/g, "\\G")
//        latexText = latexText.replace(/\H/g, "\\H")
//        latexText = latexText.replace(/\I/g, "\\I")
//        latexText = latexText.replace(/\J/g, "\\J")
//        latexText = latexText.replace(/\K/g, "\\K")
//        latexText = latexText.replace(/\L/g, "\\L")
//        latexText = latexText.replace(/\M/g, "\\M")
//        latexText = latexText.replace(/\N/g, "\\N")
//        latexText = latexText.replace(/\O/g, "\\O")
//        latexText = latexText.replace(/\P/g, "\\P")
//        latexText = latexText.replace(/\Q/g, "\\Q")
//        latexText = latexText.replace(/\R/g, "\\R")
//        latexText = latexText.replace(/\S/g, "\\S")
//        latexText = latexText.replace(/\T/g, "\\T")
//        latexText = latexText.replace(/\U/g, "\\U")
//        latexText = latexText.replace(/\V/g, "\\V")
//        latexText = latexText.replace(/\W/g, "\\W")
//        latexText = latexText.replace(/\X/g, "\\X")
//        latexText = latexText.replace(/\Y/g, "\\Y")
//        latexText = latexText.replace(/\Z/g, "\\Z")
        var imageFileName = latexRunner.createFormula(latexText, color, centered)
        source = imageFileName
    }

    LatexRunner {
        id: latexRunner
        dpi: parent.dpi
        forceCompile: parent.forceCompile
    }
}
