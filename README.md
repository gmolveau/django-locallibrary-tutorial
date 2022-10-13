# Django Local Library

Tutorial "Local Library" website written in Django (with Postgres)

For detailed information about this project see the associated [MDN tutorial home page](https://developer.mozilla.org/en-US/docs/Learn/Server-side/Django/Tutorial_local_library_website).

## Overview

This web application creates an online catalog for a small local library, where users can browse available books and manage their accounts.

The main features that have currently been implemented are:

* There are models for books, book copies, genre, language and authors.
* Users can view list and detail information for books and authors.
* Admin users can create and manage models. The admin has been optimised (the basic registration is present in admin.py, but commented out).
* Librarians can renew reserved books

![Local Library Model](https://raw.githubusercontent.com/mdn/django-locallibrary-tutorial/master/catalog/static/images/local_library_model_uml.png)


## Quick Start (with Docker)

To get this project up and running locally on your computer:
1. With make + docker and docker compose:
   ```
   make run
   make bootstrap
   ```
1. Open a browser to `http://localhost:8000/admin/` to open the admin site
1. Create a few test objects of each type.
1. Open tab to `http://localhost:8000` to see the main site, with your new objects.
