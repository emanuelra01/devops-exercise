FROM python

#UPDATE IMAGE
RUN apt update -y && apt upgrade -y


# CREATE APP DIRECTORY
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# COPY APP FILE
COPY app.py app.py
COPY requirement.txt requirement.txt

# INSTALL APP DEPENDENCIES
RUN pip install --no-cache-dir --upgrade pip \
    && pip install --no-cache-dir -r requirement.txt

# PORT TO WORK
EXPOSE 5000

# RUN APP
CMD ["python", "app.py"]