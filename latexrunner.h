#ifndef LATEXRUNNER_H
#define LATEXRUNNER_H

#include <QQuickItem>

class LatexRunner : public QQuickItem
{
    Q_OBJECT
    Q_PROPERTY(QString dpi WRITE setDpi READ dpi NOTIFY dpiChanged)
    Q_PROPERTY(bool forceCompile WRITE setForceCompile READ forceCompile NOTIFY forceCompileChanged)

public:
    LatexRunner(QQuickItem *parent = 0);

    QString dpi() const
    {
        return m_dpi;
    }

    bool forceCompile() const
    {
        return m_forceCompile;
    }

public slots:
    QString createFormula(QString formula, QString color, bool centered);
    void setDpi(QString arg)
    {
        if (m_dpi != arg) {
            m_dpi = arg;
            emit dpiChanged(arg);
        }
    }
    void setForceCompile(bool arg)
    {
        if (m_forceCompile != arg) {
            m_forceCompile = arg;
            emit forceCompileChanged(arg);
        }
    }

signals:
    void dpiChanged(QString arg);

    void forceCompileChanged(bool arg);

private:
    QString m_dpi;
    bool m_forceCompile;
};

#endif // LATEXRUNNER_H
