/****************************************************************************
** Generated QML type registration code
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include <QtQml/qqml.h>
#include <QtQml/qqmlmoduleregistration.h>

#include <backend.h>


#if !defined(QT_STATIC)
#define Q_QMLTYPE_EXPORT Q_DECL_EXPORT
#else
#define Q_QMLTYPE_EXPORT
#endif
Q_QMLTYPE_EXPORT void qml_register_types_DemoInstaller()
{
    qmlRegisterTypesAndRevisions<Backend>("DemoInstaller", 1);
    qmlRegisterModule("DemoInstaller", 1, 0);
}

static const QQmlModuleRegistration demoInstallerRegistration("DemoInstaller", qml_register_types_DemoInstaller);
