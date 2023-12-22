export PGPASSWORD=$DB_PASSWORD
if [ "$INIT_MODE" = "demo" ]; then
        cp demo_db.sql /docker-entrypoint-initdb.d/demo_db.sql
        echo "Waiting for demo data set to load..."
fi
