FROM python:alpine
WORKDIR /usr/src/app
COPY requirements.txt .
RUN pip install -r requirements.txt
COPY flaskdoc.py .
COPY templates/flaskdoc.html templates/flaskdoc.html
CMD [ "python", "flaskdoc.py"]
EXPOSE 5000
VOLUME /usr/src/app/data