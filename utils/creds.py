import os

db_creds_all = {
    "postgres": {
        "host": os.environ.get("DBHOST", "localhost"),
        "port": os.environ.get("DBPORT", 5432),
        "user": os.environ.get("DBUSER", "postgres"),
        "password": os.environ.get("DBPASSWORD", "root"),
    }
}

# bq_project = os.environ.get("BQ_PROJECT")
