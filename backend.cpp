#include "backend.h"

Backend::Backend(QObject *parent)
    : QObject{parent}
{}

void Backend::generateNumber(int min, int max)
{
    const int randNum = QRandomGenerator::global()->bounded(min, max);
    emit numberEmitted(randNum);
}

void Backend::runScript(QString scriptPath)
{

    emit scriptRun(scriptPath);
}
