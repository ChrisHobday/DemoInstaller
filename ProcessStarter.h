#ifndef PROCESSSTARTER_H
#define PROCESSSTARTER_H

#include <QObject>
#include <QtQml>

class Backend : public QObject
{
    Q_OBJECT
    QML_ELEMENT

public:
    explicit Backend(QObject *parent = nullptr);
    Q_INVOKABLE void runScript(QString scriptPath, QStringList arguments);

signals:
    void scriptRun(QString scriptOutput);
};

#endif // PROCESSSTARTER_H
