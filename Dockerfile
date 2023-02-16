FROM docker.io/python:3.11 as build

WORKDIR /usr/src/app

COPY requirements-dev.txt ./
RUN pip install --no-cache-dir -r requirements-dev.txt

COPY . .

RUN python setup.py install


FROM build AS test

WORKDIR /usr/src/app

RUN pip install pytest-cov

RUN py.test -s --cov=pyflux --pyargs pyflux


FROM build AS final

WORKDIR /usr/src

ENTRYPOINT [ "python" ]
