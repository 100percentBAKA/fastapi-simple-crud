# Use the official Python image as the base image
FROM python:3.9

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file into the container
COPY requirements.txt /app/requirements.txt

# Install the requirements
RUN pip install --no-cache-dir --upgrade -r /app/requirements.txt

# Set up a new user named "user"
RUN useradd user
# Switch to the "user" user
USER user

# Set home to the user's home directory
ENV HOME=/home/user
ENV PATH=/home/user/.local/bin:$PATH

# Set the working directory to the user's home directory
WORKDIR $HOME/app

# Copy the current directory contents into the container at $HOME/app
COPY --chown=user . $HOME/app

# Expose the port that your FastAPI app will run on
EXPOSE 8000

# Start the FastAPI App
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]