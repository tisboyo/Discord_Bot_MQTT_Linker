FROM python:3

USER root

WORKDIR /usr/src/app
ENV PIP_NO_CACHE_DIR=false \
    PIPENV_HIDE_EMOJIS=1 \
    PIPENV_IGNORE_VIRTUALENVS=1 \
    PIPENV_NOSPIN=1 \
    PIPENV_VENV_IN_PROJECT=1\
    PYTHONUNBUFFERED=1\
ENV db_user=mqtt_py
ENV db_password=password
ENV database=mqtt
ENV db_host=192.168.2.240
ENV db_port=5432
ENV mqtt_host=192.168.2.240
ENV mqtt_port=1883

# Setup pipenv
RUN pip install pipenv

RUN git clone https://github.com/tisboyo/Discord_Bot_MQTT_Linker.git && chmod +x ./Discord_Bot_MQTT_Linker/init.sh

ENTRYPOINT ["/usr/src/app/Discord_Bot_MQTT_Linker/init.sh"]
