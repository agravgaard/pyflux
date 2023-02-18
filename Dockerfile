FROM docker.io/python:3.11

WORKDIR /usr/src/app

COPY requirements-dev.txt ./
RUN pip install --no-cache-dir -r requirements-dev.txt

COPY . .

RUN python setup.py install

WORKDIR /usr/src

ENTRYPOINT [ "python" ]
