#ifndef APPLICATION_H
#define APPLICATION_H

#include <QObject>
#include <QQmlEngine>

class Application : public QObject
{
    Q_OBJECT
public:
    explicit Application(QObject *parent = nullptr);

public slots:
signals:

private:
    void registerQML();
};

#endif // APPLICATION_H
