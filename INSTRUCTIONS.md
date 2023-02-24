# This is a django app.

### Reference on how to run a django app https://data-flair.training/blogs/create-django-project/

## Approach

- CREATED A VIRTUAL ENVIRONEMENT using
  `python3 -m venv venv`
- Activated the virtual environment `source venv/bin/activate`
- Run the python main file `python3 manage.py runserver`
- BASED on the ERRORS seen the first time the app is run, install the missing dependence
- Do this using python-pip. In this case `pip install django` and run the app again
- Push all the dependencies stores in the env to a file `requirements.txt` using `pip freeze > requirements.txt` and run the app again
- Having run successfully, proceeed to create an image exploiting

  - ENTRYPOINT
  - COPY
  - ENV
  - VOLUME
  - FROM
  - WORKINGDIR
  - EXPOSE

-
