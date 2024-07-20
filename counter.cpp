#include "counter.h"
#include <QQmlApplicationEngine>
#include <QQmlContext>

Counter::Counter(QObject* parent) : QObject(parent)
{
    thread= new QThread;


    timer1=new QTimer();
   // timer2=new QTimer();


    timer1->setInterval(1000);
    connect(timer1,SIGNAL(timeout()),this,SLOT(updateTimer()));
     timer1->start();
    timer1->moveToThread(thread);
    // Thread *exp = new Thread;

     //connect(thread, &QThread::finished, timer1, &QObject::deleteLater);
    thread->start();


}

void Counter::threadDestroy(){

   // timer1->stop();
  //  timer2->stop();
    //delete m_tmr;
  //  timer1->destroyed(this);
  //  delete timer1;
    //delete m_tmr;

   // timer1->moveToThread(thread);
    thread->terminate();
   //  thread->exit();
}

void Counter::receiveFromQml(){

    emit sendToQmlValue(m_Value);

}

void Counter::setValue1(int value1) {
    if (value1 == m_Value)
        return;
    m_Value = value1;
   // timer1->start();


    emit value1Changed(value1);
}

void Counter::setValue(int value) {
    if (value == m_Value)
        return;
    m_Value = value;

    QThread *thread2= new QThread;

   // QTimer *timer2=new QTimer();

    timer2->setInterval(1000);
    connect(timer2,SIGNAL(timeout()),this,SLOT(updateTimer2()));
    timer2->start();
    timer2->moveToThread(thread2);
    thread2->start();
    QQmlApplicationEngine engine;
    // устанавливаем свойство контекста "textContent"
    engine.rootContext()->setContextProperty("label11", m_Value);


    emit valueChanged(value);
}

void Counter::updateTimer(){
    int val=m_Value;
        val++;
    setValue1(val);
}

void Counter::updateTimer2(){
    int val=m_Value;
    val++;
    setValue1(val);
}
