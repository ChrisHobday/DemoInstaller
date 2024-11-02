#include "backend.h"

Backend::Backend(QObject *parent)
    : QObject{parent}
{}

void Backend::runScript(QString scriptPath)
{
    QProcess *myProcess = new QProcess();
    myProcess->setWorkingDirectory("/var/home/chris/Projects/QT/DemoInstaller");
    myProcess->start(scriptPath, QStringList());
    myProcess->waitForFinished();
    QString scriptOutput = myProcess->readAllStandardOutput();
    QString scriptError = myProcess->readAllStandardError();

    if (scriptError != "") {
        emit scriptRun(scriptError);
    } else {
        emit scriptRun(scriptOutput);
    }
}
