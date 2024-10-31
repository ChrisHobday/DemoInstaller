#ifndef BACKEND_H
#define BACKEND_H

#include <QObject>
#include <QtQml>

class Backend : public QObject
{
    Q_OBJECT
    QML_ELEMENT
public:
    explicit Backend(QObject *parent = nullptr);
    Q_INVOKABLE void generateNumber(int min, int max);
    Q_INVOKABLE void runScript(QString scriptPath);

signals:
    void numberEmitted(int num);
    void scriptRun(QString scriptOutput);

};

#endif // BACKEND_H
