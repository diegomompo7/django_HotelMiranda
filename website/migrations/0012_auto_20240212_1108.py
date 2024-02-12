# En el archivo de migración generado
from django.db import migrations

class Migration(migrations.Migration):

    dependencies = [
        ('website', '0011_alter_contact_options'),  # Reemplaza esto con la migración anterior
    ]

    operations = [
        migrations.RunSQL("ALTER TABLE website_contact MODIFY COLUMN fullName VARCHAR(100) AFTER id;")
    ]
