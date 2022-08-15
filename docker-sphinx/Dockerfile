FROM python:3.6
COPY docker-entrypoint.sh /docker-entrypoint.sh
CMD mkdir /docs
WORKDIR /docs
COPY requirements.txt /docs/requirements.txt
RUN pip install --no-cache-dir -r requirements.txt
EXPOSE 8000
ENTRYPOINT ["/docker-entrypoint.sh"]
