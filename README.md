# Linux Monitoring



## Запуск скриптов на виртуальной машине.

1. Создаем виртуальную машину, делаем на не $sudo apt update, $sudo apt upgrade.
2. Устанавливаем ssh и apache2. $sudo apt install ssh, $sudo apt install apache2
3. выключаем вмртуальную машину -> Настройки машины -> Сеть -> Дополнительно -> Проброс порта -> Добавить порт -> Порт хоста - 3333 -> Порт гостя 22
4. Вкючаем виртуальную машину, изменяем файл etc/apache2/ports.conf в нем пишем Listen localhost:22.
5. Выполняем $service apache2 start
6. В терминале ПК выполняем команду $ssh -p 3333 имямашины@localhost
7. Генерируем ssh ключ, клонируем репозиторий, запускаем скрипт

## Part 1.
В папке 01 расположен первый скрипт, который при запуске принимает текстовый параметр и выводит этот текстовый параметр в консоль, в скрипте выполнены проверки, что параметр существует и что параметр текстовый.
Ниже приведен пример работы скрипта.

![VM](./pictures/part%201.png)


## Part 2.
В папке 02 расположен скрипт, который выводит информацию на экран в следующем виде:
**HOSTNAME** = _сетевое имя_  
**TIMEZONE** = _временная зона в виде: **America/New_York UTC -5** (временная зона, должна браться из системы и быть корректной для текущего местоположения)_  
**USER** = _текущий пользователь который запустил скрипт_  
**OS** = _тип и версия операционной системы_  
**DATE** = _текущее время в виде: **12 May 2020 12:24:36**_  
**UPTIME** = _время работы системы_  
**UPTIME_SEC** = _время работы системы в секундах_  
**IP** = _ip-адрес машины в любом из сетевых интерфейсов_  
**MASK** = _сетевая маска любого из сетевых интерфейсов в виде: **xxx.xxx.xxx.xxx**_  
**GATEWAY** = _ip шлюза по умолчанию_  
**RAM_TOTAL** = _размер оперативной памяти в Гб c точностью три знака после запятой в виде: **3.125 GB**_  
**RAM_USED** = _размер используемой памяти в Гб c точностью три знака после запятой_  
**RAM_FREE** = _размер свободной памяти в Гб c точностью три знака после запятой_  
**SPACE_ROOT** = _размер рутового раздела в Mб с точностью два знака после запятой в виде: **254.25 MB**_  
**SPACE_ROOT_USED** = _размер занятого пространства рутового раздела в Mб с точностью два знака после запятой_  
**SPACE_ROOT_FREE** = _размер свободного пространства рутового раздела в Mб с точностью два знака после запятой_

После вывода значений предлагает пользователю записать данные в файл (**Y/N**).  
Ответы **Y** и **y** считаются положительными, все прочие - отрицательными.
При согласии пользователя, в текущей директории создается файл содержащий информацию, которая была выведена на экран.  
Название файла должно иметь вид: **DD_MM_YY_HH_MM_SS.status**.
Ниже пример работы скрипта.
![VM](./pictures/part%202.png)
![VM](./pictures/part%203.png)
![VM](./pictures/part%204.png)

## Part 3.
В папке 03 расположен скрипт, который запускается с 4 числовыми параметрами. Пример запуска скрипта:
 main.sh 1 3 4 5

Обозначения цветов: (1 - white, 2 - red, 3 - green, 4 - blue, 5 – purple, 6 - black)
Параметр 1 - это фон названий значений (HOSTNAME, TIMEZONE, USER и т.д.)
Параметр 2 - это цвет шрифта названий значений (HOSTNAME, TIMEZONE, USER и т.д.)
Параметр 3 - это фон значений (после знака '=')
Параметр 4 - это цвет шрифта значений (после знака '=')

Цвета шрифта и фона одного столбца не должны совпадать.
При вводе совпадающих значений выводится сообщение, описывающее проблему, и предложение повторно вызвать скрипт.

Пример выполнения скрипта ниже:
![VM](./pictures/part%202.png)
![VM](./pictures/part%203.1.png)
![VM](./pictures/part%203.2.png)
![VM](./pictures/part%203.3.png)
![VM](./pictures/part%203.4.png)
![VM](./pictures/part%203.5.png)
![VM](./pictures/part%203.6.png)
![VM](./pictures/part%203.7.png)
![VM](./pictures/part%203.8.png)
![VM](./pictures/part%203.9.png)
![VM](./pictures/part%203.10.png)
![VM](./pictures/part%203.11.png)
![VM](./pictures/part%203.12.png)
![VM](./pictures/part%203.13.png)
![VM](./pictures/part%203.14.png)
![VM](./pictures/part%203.15.png)

## Part 4.

В папке 04 расположен скрипт, который запускается без параметров. Параметры задаются в конфигурационном файле (src/04/config.conf)до запуска скрипта. Значения параметров те же что и в part 3.

Пример работы скрипта
Когда цвета заданы в файле конфигурации
![VM](./pictures/part%204.1.png)

Когда цвета не заданы в файле конфигурации, используем default цвета 
![VM](./pictures/part%204.2.png)

## Part 5.
В папке 04 расположен скрипт, который запускается c одним параметром.
Параметр - это абсолютный или относительный путь до какой-либо директории. Параметр должен заканчиваться знаком '/', например:
script05.sh /var/log/
Скрипт выводит следующую информацию о каталоге, указанном в параметре:

- Общее число папок, включая вложенные
- Топ 5 папок с самым большим весом в порядке убывания (путь и размер)
- Общее число файлов
- Число конфигурационных файлов (с расширением .conf), текстовых файлов, исполняемых файлов, логов (файлов с расширением .log), архивов, символических ссылок
- Топ 10 файлов с самым большим весом в порядке убывания (путь, размер и тип)
- Топ 10 исполняемых файлов с самым большим весом в порядке убывания (путь, размер и хеш)
- Время выполнения скрипта

Пример работы скрипта ниже.

![VM](./pictures/part%205.1.png)
![VM](./pictures/part%205.2.png)
![VM](./pictures/part%205.3.png)
![VM](./pictures/part%205.4.png)
![VM](./pictures/part%205.5.png)






