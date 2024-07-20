#ifndef COUNTER_H
#define COUNTER_H

#include <QObject>
#include <QThread>
#include <QThreadPool>
#include <QTimer>

class Counter : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int value READ value WRITE setValue NOTIFY valueChanged)
    Q_PROPERTY(int value READ value WRITE setValue1 NOTIFY value1Changed)

    QTimer *timer1;
    QTimer *timer2;

public:
    explicit Counter(QObject *parent = nullptr);
    int value() { return m_Value; };
    int value1() { return m_Value; };

    QThreadPool pool;
    QThread* thread;

public slots:
    void receiveFromQml();
    void setValue1(int value);
    void setValue(int value);
 void threadDestroy();
    void updateTimer();
    void updateTimer2();
signals:
   void sendToQmlValue(int value);

    void valueChanged(int newValue);
void value1Changed(int newValue);
private:
    int m_Value {0} ;
    int m_Value2 {0} ;

};

#endif // COUNTER_H
