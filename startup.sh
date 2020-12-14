#!/usr/bin/env bash

# https://github.com/doccano/doccano/blob/v1.0.5/tools/run.sh
set -o errexit

# start model serving in background
echo "Starting alpaca-serving"
alpaca-serving-start &

# echo "Making staticfiles"
# if [[ ! -d "app/staticfiles" ]]; then python app/manage.py collectstatic --noinput; fi

# echo "Initializing database"
# python manage.py wait_for_db
# python manage.py migrate
# python manage.py create_roles

# echo "Creating admin"
# if [[ -n "${ADMIN_USERNAME}" ]] && [[ -n "${ADMIN_PASSWORD}" ]] && [[ -n "${ADMIN_EMAIL}" ]]; then
#   DJANGO_SUPERUSER_PASSWORD=$ADMIN_PASSWORD python manage.py createsuperuser \
#     --username "${ADMIN_USERNAME}" \
#     --email "${ADMIN_EMAIL}" \
#     --noinput \
#   || true
# fi

echo "Starting django"
python manage.py runserver "0.0.0.0:${PORT:-8000}"
