FROM python

#UPDATE IMAGE
RUN apt update && apt upgrade


# CREATE APP DIRECTORY
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# COPY APP FILE
COPY app.py app.py
COPY requirement.txt requirement.txt

# INSTALL APP DEPENDENCIES
RUN pip install --no-cache-dir --upgrade pip \
    && pip install --no-cache-dir -r requirement.txt

# RUN APP
CMD ["python", "app.py"]