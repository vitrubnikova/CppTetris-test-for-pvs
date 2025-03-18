# Инструкция по сборке и запуску Docker-образа 

**Предустановки**

- [Docker](https://docs.docker.com/engine/install/)
- [Xming X Server for Windows](https://sourceforge.net/projects/xming/)
- установить переменную окружения `set DISPLAY=localhost:0` (через Windows PowerShell)
- запущен Xming X Server for Windows
- открыто приложение Docker Desktop либо терминал с установленным Docker Engine (если через терминал - тогда можно начинать с шага 2)

**Шаги**

1. Клик на "*Terminal*" в правом нижнем углу
2. Выполнить команду `docker build -t tetris .`
3. Выполнить команду `docker run -it --rm -e DISPLAY=host.docker.internal:0 --name tetris tetris`

# Как запустить Jenkins и выполнить pipeline

**Предустановки**

- [Jenkins](https://www.jenkins.io/doc/book/installing/) (следовать инструкции)
- запущен Docker
- запущен Xming X Server for Windows

**Шаги**

1. Открыть браузер
2. В адресную строку ввести *localhost* (указать порт, который был настроен при установке)
3. Ховер на имя нужного пайплайна
4. Клик на появившийся значок выпадающего списка
5. Клик на кнопку "*Собрать сейчас*"