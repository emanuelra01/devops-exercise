FROM python

#UPDATE IMAGE
RUN apt update && apt upgrade


# CREATE APP DIRECTORY
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# COPY APP FILE
COPY .app.py .app.py
COPY .requirements.txt .requirements.txt

# INSTALL APP DEPENDENCIES
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

# RUN APP
CMD ["python", "app.py"]