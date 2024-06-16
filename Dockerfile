# Use the official Python image as the base image
FROM python:3.9

# Set the working directory in the container
WORKDIR /app

# Copy the project files to the container
COPY . /app

# Install the project dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Expose the port that your FastAPI app will run on
EXPOSE 8000

# Copy the .env file into the container
# COPY .env .env

# Start the FastAPI app
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]