FROM python:3.9.18-alpine3.19
#Exposes the port number 8080
EXPOSE 8080
USER root
#This will create /app directory and change the default working directory to /app
WORKDIR /app
COPY requirements.txt /app/
RUN apk add python3-dev build-base linux-headers pcre-dev
RUN pip install -r requirements.txt
COPY *.py /app/
COPY payment.ini /app/
#CMD ["python", "payment.py"]
CMD ["uwsgi", "--ini", "payment.ini"]