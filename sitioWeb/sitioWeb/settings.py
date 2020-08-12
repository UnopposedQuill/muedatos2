"""
Django settings for sitioWeb project.

Generated by 'django-admin startproject' using Django 3.0.8.

For more information on this file, see
https://docs.djangoproject.com/en/3.0/topics/settings/

For the full list of settings and their values, see
https://docs.djangoproject.com/en/3.0/ref/settings/
"""

import os

# Build paths inside the project like this: os.path.join(BASE_DIR, ...)
BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))


# Quick-start development settings - unsuitable for production
# See https://docs.djangoproject.com/en/3.0/howto/deployment/checklist/

# SECURITY WARNING: keep the secret key used in production secret!
SECRET_KEY = 'i9h&ossvu917g+gnxmh95qj-lljgjs=(7s+o@1!y^#e4)%05v$'

# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = True

ALLOWED_HOSTS = []


# Application definition

INSTALLED_APPS = [
    'Cliente.apps.ClienteConfig',
    'Taller.apps.TallerConfig',
    'SucursalA.apps.SucursalaConfig',
    'SucursalB.apps.SucursalbConfig',
    'SucursalC.apps.SucursalcConfig',
    'manager.apps.ManagerConfig',
    'Login.apps.LoginConfig',
    'Compra.apps.CompraConfig',
    'Catalogo.apps.CatalogoConfig',
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
]

MIDDLEWARE = [
    'django.middleware.security.SecurityMiddleware',
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
]

ROOT_URLCONF = 'sitioWeb.urls'

TEMPLATES = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        'DIRS': [],
        'APP_DIRS': True,
        'OPTIONS': {
            'context_processors': [
                'django.template.context_processors.debug',
                'django.template.context_processors.request',
                'django.contrib.auth.context_processors.auth',
                'django.contrib.messages.context_processors.messages',
            ],
        },
    },
]

WSGI_APPLICATION = 'sitioWeb.wsgi.application'


# Database
# https://docs.djangoproject.com/en/3.0/ref/settings/#databases

DATABASE_ROUTERS = ['manager.router.DatabaseAppsRouter']
DATABASE_APPS_MAPPING = {'Taller': 'taller', 
                         'SucursalA':'sucursalA', 
                         'SucursalB':'sucursalB', 
                         'SucursalC':'sucursalC', 
                         'Cliente':'atencionCliente'}

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.sqlite3',
        'NAME': os.path.join(BASE_DIR, 'db.sqlite3'),
    },
    'taller': {
        'ENGINE': 'sql_server.pyodbc',
        'NAME': 'Taller',
        'USER': 'sa',
        'PASSWORD': 'mueDatos2',
        'HOST': 'localhost',
        'PORT': '',
        'OPTIONS': {
            'driver': 'ODBC Driver 17 for SQL Server',
        },
    },
    'sucursalA': {
        'ENGINE': 'sql_server.pyodbc',
        'NAME': 'SucursalA',
        'USER': 'sa',
        'PASSWORD': 'mueDatos2',
        'HOST': 'localhost',
        'PORT': '',
        'OPTIONS': {
            'driver': 'ODBC Driver 17 for SQL Server',
        },
    },
    'sucursalB': {
        'ENGINE': 'sql_server.pyodbc',
        'NAME': 'SucursalB',
        'USER': 'sa',
        'PASSWORD': 'mueDatos2',
        'HOST': 'localhost',
        'PORT': '',
        'OPTIONS': {
            'driver': 'ODBC Driver 17 for SQL Server',
        },
    },
    'sucursalC': {
        'ENGINE': 'sql_server.pyodbc',
        'NAME': 'SucursalC',
        'USER': 'sa',
        'PASSWORD': 'mueDatos2',
        'HOST': 'localhost',
        'PORT': '',
        'OPTIONS': {
            'driver': 'ODBC Driver 17 for SQL Server',
        },
    },
    'atencionCliente': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'atencioncliente',
        'USER': 'mabo',
        'PASSWORD': 'mueDatos2',
        'HOST': '127.0.0.1',
        'PORT': '3306',
    },
}


# Password validation
# https://docs.djangoproject.com/en/3.0/ref/settings/#auth-password-validators

AUTH_PASSWORD_VALIDATORS = [
    {
        'NAME': 'django.contrib.auth.password_validation.UserAttributeSimilarityValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.MinimumLengthValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.CommonPasswordValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.NumericPasswordValidator',
    },
]


# Internationalization
# https://docs.djangoproject.com/en/3.0/topics/i18n/

LANGUAGE_CODE = 'en-us'

TIME_ZONE = 'UTC'

USE_I18N = True

USE_L10N = True

USE_TZ = True


# Static files (CSS, JavaScript, Images)
# https://docs.djangoproject.com/en/3.0/howto/static-files/

STATIC_URL = '/static/'
