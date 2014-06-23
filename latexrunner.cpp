#include "latexrunner.h"

#include <QCryptographicHash>
#include <QFileInfo>
#include <QDir>
#include <QFile>

LatexRunner::LatexRunner(QQuickItem *parent) :
    QQuickItem(parent),
    m_dpi(600),
    m_forceCompile(false)
{
}

QString LatexRunner::createFormula(QString formula, QString color, bool centered)
{
    // TODO use QProcess instead of system()
    // TODO use Qt to create directories
    qDebug() << "Requested to create formula " << formula;

    QString tmpDirName = "/tmp/latexpresentation/";
    QString baseFileData = formula + color + QString(centered) + QString(dpi());
    QString baseFileName = QCryptographicHash::hash(baseFileData.toLatin1(), QCryptographicHash::Md5).toHex();
    QString myFormulaFileName = tmpDirName + baseFileName + ".tex";

    QDir tempDir(tmpDirName);
    if(!tempDir.exists()) {
        QDir().mkdir(tmpDirName);
    }

    QString imageFileName = tmpDirName + baseFileName + ".png";
    QString returnFileName = "file://" + imageFileName;
    QFile imageFile(imageFileName);
    if(imageFile.exists() && !forceCompile()) {
        qDebug() << "Formula image exists. Using existing version.";
        return returnFileName;
    } else {
        qDebug() << "File does not exist. Creating...";
        QFile myFormulaFile(myFormulaFileName);
        myFormulaFile.open(QIODevice::WriteOnly | QIODevice::Text);
        myFormulaFile.write(formula.toUtf8());
        myFormulaFile.close();

        QString centerCommand = "";
        if(centered) {
            centerCommand = "\\def \\mycentered{} ";
        }
        QString latexCommand = "pdflatex --jobname formula \"" + centerCommand + "\\def \\mycolor{" + color + "} \\def \\myfile{" + myFormulaFileName + "} \\input{qml/latexpresentation/formula.tex}\"";
        qDebug() << latexCommand;
        system(latexCommand.toStdString().c_str());

        QString convertCommand = "convert -trim -density " + dpi() + " formula.pdf -quality 90 " + imageFileName;
        system(convertCommand.toStdString().c_str());
        qDebug() << "Done creating formula.";
    }

    return returnFileName;
}
