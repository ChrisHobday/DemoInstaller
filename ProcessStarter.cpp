#include <ProcessStarter.h>

Backend::Backend(QObject *parent)
    : QObject{parent}
{}

void Backend::runScript(QString script)
{
    QProcess *process = new QProcess(); // Create a process that will run the given script
    // process->setWorkingDirectory(""); // Set working directory where given script will be executed
    process->start(script, QStringList()); // Start the given script
    process->waitForFinished();

    QString scriptOutput = process->readAllStandardOutput(); // Stores script output
    QString scriptError = process->readAllStandardError(); // Stores script errors

    if (scriptError != "") { // If there are script errors
        emit scriptRun(scriptError); // Emit the script errors
    } else {
        emit scriptRun(scriptOutput); // Emit the script output
    }
}
