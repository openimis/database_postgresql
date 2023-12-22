export PGPASSWORD=$DB_PASSWORD
if [ "$INIT_MODE" = "demo" ]; then
        psql -U $DB_USER -d $DB_NAME < demo_db.sql
fi
