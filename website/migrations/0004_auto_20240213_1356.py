# Generated by Django 3.2.12 on 2024-02-13 13:56

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('website', '0003_auto_20240213_1344'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='booking',
            options={},
        ),
        migrations.AlterModelTable(
            name='booking',
            table='website_booking',
        ),
    ]
