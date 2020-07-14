# Use an official Python runtime as a parent image
FROM python:3.8.3-buster

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Make port 80 available to the world outside this container
EXPOSE 8080

RUN python -m nltk.downloader punkt

# Define environment variable
ENV APP_SETTINGS "config.DevelopmentConfig"
ENV FLASK_ENV "development"
ENV DATABASE_URL "postgresql://docker:docker@db:5432/wordcount_dev"

# RUN ["service", "postgresql", "start"]
# RUN ["python3", "manage.py", "db", "upgrade"]

# Run app.py when the container launches
# CMD ["python3", "manage.py", "runserver", "0.0.0.0:8080"]
# CMD ["python", "simpleapp.py"]
CMD ["./start.sh"]
# CMD ["sh"]
