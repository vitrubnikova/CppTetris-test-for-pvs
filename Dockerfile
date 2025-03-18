FROM debian:bullseye

RUN dpkg --add-architecture i386 && apt-get update && apt-get install -y \
    build-essential \
    git \
    libncurses5-dev \
    mingw-w64 \
    wine64 \
    xauth \
    && rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/DQNEO/CppTetris.git /app

# Проверка установки Wine
RUN wine64 --version

WORKDIR /app

RUN x86_64-w64-mingw32-windres -i block.rc -o block.o
RUN x86_64-w64-mingw32-gcc -mwindows tetris.cpp block.o -o tetris_new.exe

# Проверка, что tetris_new.exe существует
RUN if [ ! -f "tetris_new.exe" ]; then echo "tetris_new.exe not found!" && exit 1; fi

CMD ["wine64", "tetris_new.exe"]
