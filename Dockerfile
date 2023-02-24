# FROM python:3.8.3-slim

# ENV DockerHOME=/home/app/webapp 

# WORKDIR /app

# COPY requirements.txt .

# # install everything in requirements file
# RUN pip install -r requirements.txt

# COPY . .



# # dont include extra code
# ENV PYTHONDONTWRITEBYTECODE=1
# #capture logs
# ENV PYTHONUNBUFFERED=1 


# VOLUME [ "/app/data" ]

# # port where the Django app runs
# EXPOSE 8000

# ENTRYPOINT [ "python3","manage.py","runserver", "8000"]



# base image  
FROM python:3.8   

# setup environment variable  
ENV DockerHOME=/home/app  
ENV VolumeFolder=/home/app/data  

# create work directory  
RUN mkdir -p $DockerHOME  

# create volume directory  
RUN mkdir -p $VolumeFolder

# set directory where the app sits  
WORKDIR $DockerHOME  

# copy requirements file to the above directory
COPY requirements.txt $DockerHOME 



# prevent python from writing bytecode
ENV PYTHONDONTWRITEBYTECODE=1

# capture logs
ENV PYTHONUNBUFFERED=1 



# upgrade pip package  
RUN pip install --upgrade pip  

# copy whole project to your docker home directory. 
COPY . $DockerHOME  

# install all dependencieslisted in the file
RUN pip install -r requirements.txt  

VOLUME [ "/home/app/data" ]


# set the entrypoint
ENTRYPOINT ["python", "manage.py"]

# port where the Django app runs  
EXPOSE 8000  

# default command to start the server  
CMD ["runserver", "0.0.0.0:8000"]
