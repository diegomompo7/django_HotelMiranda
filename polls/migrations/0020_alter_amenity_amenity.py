# Generated by Django 3.2.12 on 2024-02-07 17:35

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('polls', '0019_auto_20240207_1338'),
    ]

    operations = [
        migrations.AlterField(
            model_name='amenity',
            name='amenity',
            field=models.JSONField(),
        ),
    ]