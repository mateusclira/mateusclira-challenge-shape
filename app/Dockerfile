FROM python:3.10-slim as dev

WORKDIR /usr/src/app

COPY . .

RUN apt-get update && apt-get install -y curl

RUN pip install -r requirements.txt

HEALTHCHECK --interval=30s --timeout=10s --retries=3 \
  CMD curl -f http://localhost/ || exit 1

EXPOSE 9555

ENTRYPOINT [ "python", "app.py" ]
