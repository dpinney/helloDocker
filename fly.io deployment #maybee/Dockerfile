FROM python:alpine
WORKDIR /usr/src/app
COPY requirements.txt .
RUN pip install -r requirements.txt
COPY flaskdoc.py .
CMD [ "python", "flaskdoc.py"]
EXPOSE 5000
